import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UploadPlaceService {
  UploadPlaceService(this.firebaseFirestore);
  final FirebaseFirestore firebaseFirestore;

  FutureResult<Unit> uploadPlace(PlaceCell placeCell) async {
    try {
      // add Local area
      final district = await firebaseFirestore
          .collection('locations')
          .doc(placeCell.country)
          .collection(placeCell.state)
          .doc(placeCell.state)
          .collection(placeCell.district)
          .doc(placeCell.district)
          .get();
      if (district.exists) {
        // Get LocalArea Map List // [{Nilambur: Instance of 'GeoPoint'}]
        final localAreaList =
            (district.data()?['localArea'] as List<dynamic>?) ?? [];
        // map convert localArea key then convert
        final localAreaKeysList = <String>[];
        for (final localArea in localAreaList) {
          final localAreaMap = localArea as Map<String, dynamic>;
          // ignore: cascade_invocations
          localAreaMap.forEach((key, value) {
            localAreaKeysList.add(key);
          });
        }

        if (!localAreaKeysList.contains(placeCell.localArea)) {
          await firebaseFirestore
              .collection('locations')
              .doc(placeCell.country)
              .collection(placeCell.state)
              .doc(placeCell.state)
              .collection(placeCell.district)
              .doc(placeCell.district)
              .update({
            'localArea': FieldValue.arrayUnion([
              {
                placeCell.localArea: GeoPoint(
                  placeCell.geoPoint.latitude,
                  placeCell.geoPoint.longitude,
                ),
              },
            ]),
          });
        }
        return right(unit); // stop and set location
      }

      // add district
      final state = await firebaseFirestore
          .collection('locations')
          .doc(placeCell.country)
          .collection(placeCell.state)
          .doc(placeCell.state)
          .get();

      if (state.exists) {
        // Get LocalArea Map List // [{Malappuram: Instance of 'GeoPoint'}]
        final districtList =
            (state.data()?['district'] as List<dynamic>?) ?? [];
        // map convert district key then convert
        final districtKeysList = <String>[];
        for (final district in districtList) {
          final districtMap = district as Map<String, dynamic>;
          // ignore: cascade_invocations
          districtMap.forEach((key, value) {
            districtKeysList.add(key);
          });
        }

        log(districtKeysList.toString());

        final batch = firebaseFirestore.batch();
        if (!districtKeysList.contains(placeCell.district)) {
          batch.update(
            firebaseFirestore
                .collection('locations')
                .doc(placeCell.country)
                .collection(placeCell.state)
                .doc(placeCell.state),
            {
              'district': FieldValue.arrayUnion([
                {
                  placeCell.district: GeoPoint(
                    placeCell.geoPoint.latitude,
                    placeCell.geoPoint.longitude,
                  ),
                }
              ]),
            },
          );
        }
        batch.set(
          firebaseFirestore
              .collection('locations')
              .doc(placeCell.country)
              .collection(placeCell.state)
              .doc(placeCell.state)
              .collection(placeCell.district)
              .doc(placeCell.district),
          {
            'localArea': FieldValue.arrayUnion([
              {
                placeCell.localArea: GeoPoint(
                  placeCell.geoPoint.latitude,
                  placeCell.geoPoint.longitude,
                ),
              }
            ]),
          },
        );

        await batch.commit();
        return right(unit); // stop and set location
      }

      // add state
      final country = await firebaseFirestore
          .collection('locations')
          .doc(placeCell.country)
          .get();
      if (country.exists) {
        // Get LocalArea Map List // [{Kerala: Instance of 'GeoPoint'}]
        final stateList = (country.data()?['state'] as List<dynamic>?) ?? [];

        // map convert state key then convert
        final stateKeysList = <String>[];
        for (final state in stateList) {
          final stateMap = state as Map<String, dynamic>;
          // ignore: cascade_invocations
          stateMap.forEach((key, value) {
            stateKeysList.add(key);
          });
        }

        final batch = firebaseFirestore.batch();
        if (!stateKeysList.contains(placeCell.state)) {
          batch.update(
            // update
            firebaseFirestore.collection('locations').doc(placeCell.country),
            {
              'state': FieldValue.arrayUnion([
                {
                  placeCell.state: GeoPoint(
                    placeCell.geoPoint.latitude,
                    placeCell.geoPoint.longitude,
                  ),
                }
              ]),
            },
          );
        }
        batch
          ..set(
            firebaseFirestore
                .collection('locations')
                .doc(placeCell.country)
                .collection(placeCell.state)
                .doc(placeCell.state),
            {
              'district': FieldValue.arrayUnion([
                {
                  placeCell.district: GeoPoint(
                    placeCell.geoPoint.latitude,
                    placeCell.geoPoint.longitude,
                  ),
                }
              ]),
            },
          )
          ..set(
            firebaseFirestore
                .collection('locations')
                .doc(placeCell.country)
                .collection(placeCell.state)
                .doc(placeCell.state)
                .collection(placeCell.district)
                .doc(placeCell.district),
            {
              'localArea': FieldValue.arrayUnion([
                {
                  placeCell.localArea: GeoPoint(
                    placeCell.geoPoint.latitude,
                    placeCell.geoPoint.longitude,
                  ),
                }
              ]),
            },
          );

        await batch.commit();
        return right(unit); // stop and set location
      }

      // add country
      final batch = firebaseFirestore.batch()
        ..set(
          // set
          firebaseFirestore.collection('locations').doc(placeCell.country),
          {
            'state': FieldValue.arrayUnion([
              {
                placeCell.state: GeoPoint(
                  placeCell.geoPoint.latitude,
                  placeCell.geoPoint.longitude,
                ),
              }
            ]),
          },
        )
        ..set(
          firebaseFirestore
              .collection('locations')
              .doc(placeCell.country)
              .collection(placeCell.state)
              .doc(placeCell.state),
          {
            'district': FieldValue.arrayUnion([
              {
                placeCell.district: GeoPoint(
                  placeCell.geoPoint.latitude,
                  placeCell.geoPoint.longitude,
                ),
              }
            ]),
          },
        )
        ..set(
          firebaseFirestore
              .collection('locations')
              .doc(placeCell.country)
              .collection(placeCell.state)
              .doc(placeCell.state)
              .collection(placeCell.district)
              .doc(placeCell.district),
          {
            'localArea': FieldValue.arrayUnion([
              {
                placeCell.localArea: GeoPoint(
                  placeCell.geoPoint.latitude,
                  placeCell.geoPoint.longitude,
                ),
              }
            ]),
          },
        );

      await batch.commit();
      return right(unit); // stop and set location
    } on FirebaseException catch (e) {
      return left(
        MainFailure.serverFailure(
          errorMsg: e.code,
        ),
      );
    } catch (e) {
      return left(
        MainFailure.serverFailure(
          errorMsg: '$e',
        ),
      );
    }
  }
}
