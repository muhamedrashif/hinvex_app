import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hinvex_app/features/location/data/model/location_model_main.dart/location_model_main.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

class LocationService {
  static const String apikey = 'AIzaSyAtdiojUpua_HUorIa1wiTQXVRTanYkF6E';
  static Dio dio = Dio();
  static FutureResult<LocationModel> getLocation({
    required String lattitude,
    required String longitude,
  }) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lattitude,$longitude&key=$apikey';

    log(url);

    try {
      final response = await dio.get<dynamic>(url);
      log(response.data.toString());
      final adress =
          LocationModel.fromMap(response.data as Map<String, dynamic>);

      return right(adress);
    } catch (err) {
      log('ERROR IN CONVERT TO ADRESS FUNCTION : $err');
      return left(MainFailure.serverFailure(errorMsg: err.toString()));
    }
  }

  //SEARCH LOCATION
  static Future<List<PlaceResult>?> searchPlaces(String input) async {
    List<PlaceResult>? result;
    try {
      final uri =
          Uri.https('maps.googleapis.com', '/maps/api/place/textsearch/json', {
        'query': input,
        'key': apikey,
      });
      // ignore: inference_failure_on_function_invocation
      final res = await dio.getUri(uri);

      if (res.statusCode == 200) {
        // ignore: avoid_dynamic_calls
        final predictions = res.data['results'] as List<dynamic>;

        result = predictions
            .map((e) => PlaceResult.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        log('SEARCH PLACES: ${res.statusCode}');
      }
    } catch (err) {
      log('SEARCH PLACES: $err');
    }
    return result;
  }

  static FutureResult<LocationModel> userSearchPlaces(String input) async {
    try {
      final uri =
          Uri.https('maps.googleapis.com', '/maps/api/place/textsearch/json', {
        'query': input,
        'key': apikey,
      });
      final response = await dio.getUri<dynamic>(uri);

      log(response.data.toString());

      if (response.statusCode == 200) {
        return right(
          LocationModel.fromMap(response.data as Map<String, dynamic>),
        );
      } else {
        return left(
          MainFailure.serverFailure(
            errorMsg: response.statusMessage ?? 'Server Error',
          ),
        );
      }
    } catch (err) {
      return left(MainFailure.serverFailure(errorMsg: err.toString()));
    }
  }
}

@lazySingleton
class GetPosition {
  GetPosition();

  Future<Either<MainFailure, Position>> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();

      return right(position);
    } catch (e) {
      log('location error $e');
      return left(MainFailure.locationFailure(errorMsg: e.toString()));
    }
  }

  Future<bool> serveiceEnabled() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Geolocator.openLocationSettings();
    } else {
      return true;
    }
  }

  Future<LocationPermission> checkLocationPermission() async {
    try {
      final permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        final newPermission = await Geolocator.requestPermission();
        return newPermission;
      } else {
        return permission;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
