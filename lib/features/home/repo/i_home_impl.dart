import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:hinvex_app/features/home/data/i_home_facade.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/failures/failures.dart';
import 'package:hinvex_app/general/typedefs/typedefs.dart';
import 'package:hinvex_app/general/utils/enums/enums.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHomeFacade)
class IHomeImpl implements IHomeFacade {
  IHomeImpl(this.firebaseFirestore);
  final FirebaseFirestore firebaseFirestore;

  LocationSortEnum locationSortEnum = LocationSortEnum.localArea;
  QueryDocumentSnapshot<Map<String, dynamic>>? lastdoc;
  int limit = 10;
  //
  List<List<String>> localAreaSubList = [];
  List<List<String>> districtSubList = [];
  List<List<String>> stateSubList = [];
  int currentIndex = 0;
  int currentDistrictIndex = 0;
  int currentStateIndex = 0;

  //
  final collection = 'posts';
  final baseDir = 'propertyLocation.';
  final timestamp = 'createDate';
  final locationsCollection = 'locations';

  @override
  FutureResult<List<PropertyModel>> fetchProduct(PlaceCell placeMark) async {
    if (locationSortEnum == LocationSortEnum.noDataFound) {
      return left(
        const MainFailure.noDataFountFailure(errorMsg: 'No data found!'),
      );
    }
    try {
      final docList = <QueryDocumentSnapshot<Map<String, dynamic>>>[];

      // LocalArea
      if (locationSortEnum == LocationSortEnum.localArea) {
        if (localAreaSubList.isNotEmpty) {
          QuerySnapshot<Map<String, dynamic>> refreshedClass;
          refreshedClass = (lastdoc == null)
              ? await FirebaseFirestore.instance
                  .collection(collection)
                  .where('${baseDir}district', isEqualTo: placeMark.district)
                  .where('${baseDir}localArea', isEqualTo: placeMark.localArea)
                  .orderBy(timestamp)
                  .limit(limit)
                  .get()
              : await FirebaseFirestore.instance
                  .collection(collection)
                  .where('${baseDir}district', isEqualTo: placeMark.district)
                  .where('${baseDir}localArea', isEqualTo: placeMark.localArea)
                  .orderBy(timestamp)
                  .startAfterDocument(lastdoc!)
                  .limit(limit)
                  .get();

          if (refreshedClass.docs.length >= limit) {
            lastdoc = refreshedClass.docs.last;
          } else {
            lastdoc = null;
            locationSortEnum = LocationSortEnum.district;
          }
          docList.addAll(refreshedClass.docs);
        } else {
          // localAreaSubList Empty
          lastdoc = null;
          locationSortEnum = LocationSortEnum.district;
        }
      }
      //LocalArea END
      //

      // District
      if (locationSortEnum == LocationSortEnum.district) {
        final localAreaList = removeCurrentLocationElement(
          localAreaSubList,
          placeMark.localArea ?? '',
        );
        if (localAreaList.isNotEmpty) {
          do {
            QuerySnapshot<Map<String, dynamic>> refreshedClass;

            refreshedClass = (lastdoc == null)
                ? await FirebaseFirestore.instance
                    .collection(collection)
                    .where('${baseDir}district', isEqualTo: placeMark.district)
                    .where(
                      '${baseDir}localArea',
                      whereIn: localAreaList[currentIndex],
                    )
                    .orderBy(timestamp)
                    .limit(limit)
                    .get()
                : await FirebaseFirestore.instance
                    .collection(collection)
                    .where('${baseDir}district', isEqualTo: placeMark.district)
                    .where(
                      '${baseDir}localArea',
                      whereIn: localAreaList[currentIndex],
                    )
                    .orderBy(timestamp)
                    .startAfterDocument(lastdoc!)
                    .limit(limit)
                    .get();

            if (refreshedClass.docs.length < limit) {
              currentIndex++;
              if ((localAreaList.length - 1) >= currentIndex) {
                docList.addAll(refreshedClass.docs);
                lastdoc = null;
                continue;
              } else {
                docList.addAll(refreshedClass.docs);
                lastdoc = null;
                locationSortEnum = LocationSortEnum.state;
              }
            } else {
              lastdoc = refreshedClass.docs.last;
              docList.addAll(refreshedClass.docs);
              break;
            }
          } while (currentIndex <= (localAreaList.length - 1));
        } else {
          lastdoc = null;
          locationSortEnum = LocationSortEnum.state;
        }
      }

      // State
      if (locationSortEnum == LocationSortEnum.state) {
        final districtList = removeCurrentLocationElement(
          districtSubList,
          placeMark.district,
        );

        if (districtList.isNotEmpty) {
          do {
            QuerySnapshot<Map<String, dynamic>> refreshedClass;

            refreshedClass = (lastdoc == null)
                ? await FirebaseFirestore.instance
                    .collection(collection)
                    .where('${baseDir}state', isEqualTo: placeMark.state)
                    .where(
                      '${baseDir}district',
                      whereIn: districtList[currentDistrictIndex],
                    )
                    .orderBy(timestamp)
                    .limit(limit)
                    .get()
                : await FirebaseFirestore.instance
                    .collection(collection)
                    .where('${baseDir}state', isEqualTo: placeMark.state)
                    .where(
                      '${baseDir}district',
                      whereIn: districtList[currentDistrictIndex],
                    )
                    .orderBy(timestamp)
                    .startAfterDocument(lastdoc!)
                    .limit(limit)
                    .get();

            if (refreshedClass.docs.length < limit) {
              currentDistrictIndex++;
              if ((districtList.length - 1) >= currentDistrictIndex) {
                docList.addAll(refreshedClass.docs);
                lastdoc = null;
                continue;
              } else {
                docList.addAll(refreshedClass.docs);
                lastdoc = null;
                locationSortEnum = LocationSortEnum.contrary;
              }
            } else {
              lastdoc = refreshedClass.docs.last;
              docList.addAll(refreshedClass.docs);
              break;
            }
          } while (currentDistrictIndex <= (districtList.length - 1));
        } else {
          lastdoc = null;
          locationSortEnum = LocationSortEnum.contrary;
        }
      }

      // Contrary
      if (locationSortEnum == LocationSortEnum.contrary) {
        final stateList = removeCurrentLocationElement(
          stateSubList,
          placeMark.state,
        );

        if (stateList.isNotEmpty) {
          do {
            QuerySnapshot<Map<String, dynamic>> refreshedClass;

            refreshedClass = (lastdoc == null)
                ? await FirebaseFirestore.instance
                    .collection(collection)
                    .where('${baseDir}country', isEqualTo: placeMark.country)
                    .where(
                      '${baseDir}state',
                      whereIn: stateList[currentStateIndex],
                    )
                    .orderBy(timestamp)
                    .limit(limit)
                    .get()
                : await FirebaseFirestore.instance
                    .collection(collection)
                    .where('${baseDir}country', isEqualTo: placeMark.country)
                    .where(
                      '${baseDir}state',
                      whereIn: stateList[currentStateIndex],
                    )
                    .orderBy(timestamp)
                    .startAfterDocument(lastdoc!)
                    .limit(limit)
                    .get();

            if (refreshedClass.docs.length < limit) {
              currentStateIndex++;
              if ((stateList.length - 1) >= currentStateIndex) {
                docList.addAll(refreshedClass.docs);
                lastdoc = null;
                continue;
              } else {
                docList.addAll(refreshedClass.docs);
                lastdoc = null;
                locationSortEnum = LocationSortEnum.noDataFound;
              }
            } else {
              lastdoc = refreshedClass.docs.last;
              docList.addAll(refreshedClass.docs);
              break;
            }
          } while (currentStateIndex <= (stateList.length - 1));
        } else {
          lastdoc = null;
          locationSortEnum = LocationSortEnum.noDataFound;
        }
      }

      return right(docList.map((e) => PropertyModel.fromSnap(e)).toList());
    } on FirebaseException catch (e) {
      return left(
        MainFailure.serverFailure(errorMsg: e.code),
      );
    } on Exception catch (e) {
      return left(
        MainFailure.serverFailure(errorMsg: '$e'),
      );
    }
  }

  @override
  void clearData() {
    locationSortEnum = LocationSortEnum.localArea;
    lastdoc = null;
    currentIndex = 0;
    currentDistrictIndex = 0;
    currentStateIndex = 0;
  }

  @override
  FutureResult<Unit> fecthUserLocaltion(PlaceCell placeMark) async {
    try {
      final futureList = <Future<DocumentSnapshot<Map<String, dynamic>>>>[
        // get district doc
        firebaseFirestore
            .collection(locationsCollection)
            .doc(placeMark.country)
            .collection(placeMark.state)
            .doc(placeMark.state)
            .collection(placeMark.district)
            .doc(placeMark.district)
            .get(),
        // get state doc
        firebaseFirestore
            .collection(locationsCollection)
            .doc(placeMark.country)
            .collection(placeMark.state)
            .doc(placeMark.state)
            .get(),
        // get country doc
        firebaseFirestore
            .collection(locationsCollection)
            .doc(placeMark.country)
            .get(),
      ];
      var localAreaList = <String>[];
      var districtList = <String>[];
      var stateList = <String>[];
      final location = await Future.wait(futureList);
      // district
      if (location[0].exists) {
        localAreaList = List<String>.from(location[0].data()?['localArea'])
                as List<String>? ??
            [];
      }

      // state
      if (location[1].exists) {
        districtList = List<String>.from(location[1].data()?['district'])
                as List<String>? ??
            [];
      }

      // country
      if (location[2].exists) {
        stateList =
            List<String>.from(location[2].data()?['state']) as List<String>? ??
                [];
      }

      localAreaSubList = _splitLocation(localAreaList, 10);
      districtSubList = _splitLocation(districtList, 10);
      stateSubList = _splitLocation(stateList, 10);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(
        MainFailure.serverFailure(errorMsg: e.code),
      );
    } on Exception catch (e) {
      return left(
        MainFailure.serverFailure(errorMsg: '$e'),
      );
    }
  }

  List<List<String>> _splitLocation(List<String> location, int chunkSize) {
    final result = <List<String>>[];
    for (var i = 0; i < location.length; i += chunkSize) {
      final end =
          (i + chunkSize < location.length) ? i + chunkSize : location.length;
      result.add(location.sublist(i, end));
    }
    return result;
  }

  List<List<String>> removeCurrentLocationElement(
    List<List<String>> locationSubList,
    String elementToRemove,
  ) {
    return locationSubList
        .map(
          (list) =>
              list.where((element) => element != elementToRemove).toList(),
        )
        .where((list) => list.isNotEmpty)
        .toList();
  }
}

// @LazySingleton(as: IHomeFacade)
// class IHomeImpl implements IHomeFacade {
//   IHomeImpl(this._firestore);
//   final FirebaseFirestore _firestore;

//   // QueryDocumentSnapshot<Map<String, dynamic>>? lastDoc;
//   // bool noMoreData = false;

//   // // FETCH MOBILE BANNERS
//   // @override
//   // Future<QuerySnapshot<Map<String, dynamic>>> fetchMobileBanners() {
//   //   try {
//   //     final result = _firestore
//   //         .collection('banners')
//   //         .orderBy('timestamp', descending: true)
//   //         .where('status', isEqualTo: '1')
//   //         .get();

//   //     return result;
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return Future.error(e);
//   //   }
//   // }

//   // @override
//   // FutureResult<List<PropertyModel>> fetchProduct() async {
//   //   if (noMoreData == true) return right([]); //THERE IS NOMORE DATA
//   //   try {
//   //     final result = lastDoc == null
//   //         ? await _firestore
//   //             .collection('posts')
//   //             .orderBy('createDate', descending: true)
//   //             .limit(5)
//   //             .get()
//   //         : await _firestore
//   //             .collection('posts')
//   //             .orderBy('createDate', descending: true)
//   //             .startAfterDocument(lastDoc!)
//   //             .limit(5)
//   //             .get();
//   //     log("result  ${result.docs.length}");

//   //     if (result.docs.length < 5 || result.docs.isEmpty) {
//   //       noMoreData = true;
//   //     } else {
//   //       lastDoc = result.docs.last;
//   //     }

//   //     final propertyList =
//   //         result.docs.map((e) => PropertyModel.fromSnap(e)).toList();

//   //     return right(propertyList);
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return left(MainFailure.noDataFountFailure(errorMsg: e.toString()));
//   //   }
//   // }

//   // @override
//   // void clearData() {
//   //   lastDoc = null;
//   //   noMoreData = false;
//   // }
// }
