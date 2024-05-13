import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hinvex_app/features/authentication/data/model/user_details_model.dart';
import 'package:hinvex_app/features/location/data/i_location_facade.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/features/location/data/model/popular_cities_model/popularcities_model.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/general/failures/exeception/execeptions.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/services/location_service.dart'
    show GetPosition;
import 'package:hinvex_app/general/services/upload_location_services.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: ILocationFacade)
class ILocationImpl implements ILocationFacade {
  ILocationImpl(
    this._firestore,
    this.getCurrentPosition,
    this.sharedPreferences,
    this.uploadPlaceService,
  );
  final FirebaseFirestore _firestore;
  final GetCurrentPosition getCurrentPosition;
  final SharedPreferences sharedPreferences;
  final UploadPlaceService uploadPlaceService;
  @override
  Stream<Either<MainFailure, PlaceCell>> getUserCurrentPosition() {
    return getCurrentPosition();
  }

  @override
  FutureResult<Unit> saveUserLocation(String data) async {
    try {
      final result = await sharedPreferences.setString('placeMark', data);

      if (result) {
        return right(unit);
      } else {
        return left(
          const MainFailure.locationFailure(errorMsg: 'Somthing went wrong'),
        );
      }
    } on Exception catch (_) {
      return left(
        const MainFailure.locationFailure(errorMsg: 'Somthing went wrong'),
      );
    }
  }

  @override
  FutureResult<PlaceCell> serchLocationByAddres({
    required String latitude,
    required String longitude,
  }) async {
    final result = await LocationService.getLocation(
      latitude: latitude,
      longitude: longitude,
    );

    return result.fold(
      left,
      (r) async {
        final placeCell = getCurrentPosition.convertToPlaceCell(
          locationModel: r,
          latitude: double.parse(latitude),
          longitude: double.parse(longitude),
        );

        final result = await uploadPlaceService.uploadPlace(placeCell);
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"userLocation": placeCell.toMap()});

        return result.fold(
          left,
          (r) => right(placeCell),
        );
      },
    );
  }

  @override
  FutureResult<List<PlaceResult>> pickLocationFromSearch(
    String searchText,
  ) async {
    try {
      final res = await LocationService.searchPlaces(searchText);
      if (res != null) {
        return right(res);
      } else {
        return left(
          const MainFailure.noDataFountFailure(errorMsg: 'No result found'),
        );
      }
    } catch (e) {
      return left(MainFailure.serverFailure(errorMsg: e.toString()));
    }
  }

  @override
  FutureResult<bool> openSettings() async {
    final status = await Geolocator.openAppSettings();

    if (status) {
      return right(true);
    } else {
      return left(
        const MainFailure.serverFailure(errorMsg: 'Permission Denied'),
      );
    }
  }

  @override
  FutureResult<List<PopularCitiesModel>> fetchPopularCities() async {
    try {
      final result = await _firestore.collection('popularcities').get();
      final popularCitiesModel =
          result.docs.map((doc) => PopularCitiesModel.fromSnap(doc)).toList();

      return Right(popularCitiesModel);
    } catch (e, stackTrace) {
      print(e.toString());
      log("Error fetching next reports: $e", stackTrace: stackTrace);
      throw CustomExeception('Error fetching next reports: $e');
    }
  }
}

@lazySingleton
class GetCurrentPosition {
  GetCurrentPosition(
    this.getUserCurrentUserPosition,
    this.sharedPreferences,
    this.uploadPlaceService,
  );

  final GetPosition getUserCurrentUserPosition;
  final SharedPreferences sharedPreferences;
  final UploadPlaceService uploadPlaceService;

  Stream<Either<MainFailure, PlaceCell>> call() async* {
    final controller = StreamController<Either<MainFailure, PlaceCell>>();
    try {
      final permission =
          await getUserCurrentUserPosition.checkLocationPermission();

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == LocationPermission.unableToDetermine) {
        await updatePermissionStatus();
        controller.add(
          left(
            const MainFailure.serverFailure(errorMsg: 'Permission Denied'),
          ),
        );
      } else {
        final data = await getUserCurrentUserPosition.getCurrentLocation();
        data.fold(
          (l) => controller.add(
            left(l),
          ),
          (position) async {
            final result = await LocationService.getLocation(
              latitude: position.latitude.toString(),
              longitude: position.longitude.toString(),
            );

            result.fold(
              (l) => controller.add(
                left(l),
              ),
              (r) async {
                final placeCell = convertToPlaceCell(
                  locationModel: r,
                  latitude: position.latitude,
                  longitude: position.longitude,
                );

                final result = await uploadPlaceService.uploadPlace(placeCell);
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({"userLocation": placeCell.toMap()});

                controller.add(result.fold(
                  left,
                  (r) => right(placeCell),
                ));
              },
            );
          },
        );
      }
    } catch (e) {
      controller.add(
        left(
          MainFailure.locationFailure(errorMsg: e.toString()),
        ),
      );
    }
    yield* controller.stream;
  }

  Future<void> updatePermissionStatus() async {
    final value = sharedPreferences.getInt('permissionDenied');
    if (value is int) {
      await sharedPreferences.setInt('permissionDenied', value + 1);
    } else {
      await sharedPreferences.setInt('permissionDenied', 1);
    }
  }

  PlaceCell convertToPlaceCell({
    required LocationModel locationModel,
    required double longitude,
    required double latitude,
  }) {
    final placeMark = <String, dynamic>{};

    locationModel.results?[0].addressComponents?.forEach(
      (e) {
        final typeActions = {
          'postal_code': () => placeMark['pincode'] = e.longName ?? '',
          'administrative_area_level_1': () =>
              placeMark['state'] = e.longName ?? '',
          'administrative_area_level_3': () =>
              placeMark['district'] = e.longName ?? '',
          'locality': () => placeMark['localArea'] = e.longName ?? '',
          'country': () => placeMark['country'] = e.longName ?? '',
        };

        e.types?.forEach(
          (type) {
            if (typeActions.containsKey(type)) {
              typeActions[type]!();
            }
          },
        );
      },
    );

    placeMark['geoPoint'] = LandMark(
      latitude: latitude,
      longitude: longitude,
    ).toMap();

    return PlaceCell.fromMap(placeMark);
  }
}
