import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';
import 'package:hinvex_app/general/utils/enums/enums.dart';

class PropertyModel {
  final String? id;
  final String? userId;
  final Timestamp? createDate;
  final Timestamp? updateDate;
  final SelectedCategory? propertyCategory;
  final SelectedType? propertyType;
  final int? propertyPrice;
  // final String? propertyLink;
  List<dynamic>? propertyImage;
  final String? propertyTitle;
  final String? propertyDetils;
  final PlaceCell? propertyLocation;
  final int? bedRooms;
  final int? bathRooms;
  final SelectedFurnisher? furnishing;
  final ConstructionStatus? constructionStatus;
  final SelectedListedBy? listedBy;
  final int? superBuiltupAreaft;
  final int? carpetAreaft;
  final int? totalFloors;
  final int? floorNo;
  final int? carParking;
  final String? projectName;
  final String? description;
  final int? noOfReports;
  final String? phoneNumber;
  final String? whatsAppNumber;
  final int? plotArea;
  final int? plotLength;
  final int? plotBreadth;
  final int? washRoom;
  final int? pricePerstft;
  final int? bhk;
  final List? keywords;
  final String? webBannerId;
  List? reportReasons;
  final String? mobileBannerId;

  PropertyModel({
    this.id,
    this.userId,
    this.createDate,
    this.updateDate,
    this.propertyCategory,
    this.propertyType,
    this.propertyPrice,
    this.propertyImage,
    this.propertyTitle,
    this.propertyDetils,
    this.propertyLocation,
    this.bedRooms,
    this.bathRooms,
    this.furnishing,
    this.constructionStatus,
    this.listedBy,
    this.superBuiltupAreaft,
    this.carpetAreaft,
    this.totalFloors,
    this.floorNo,
    this.carParking,
    this.projectName,
    this.description,
    this.noOfReports,
    this.phoneNumber,
    this.whatsAppNumber,
    this.plotArea,
    this.plotLength,
    this.plotBreadth,
    this.washRoom,
    this.pricePerstft,
    this.bhk,
    this.keywords,
    this.webBannerId,
    this.reportReasons,
    this.mobileBannerId,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createDate": createDate,
        "updateDate": updateDate,
        "propertyCategory": propertyCategory?.name,
        "propertyType": propertyType?.name,
        "propertyPrice": propertyPrice,
        "propertyImage": propertyImage,
        "propertyTitle": propertyTitle,
        "propertyDetils": propertyDetils,
        "propertyLocation": propertyLocation?.toMap(),
        "bedRooms": bedRooms,
        "bathRooms": bathRooms,
        "furnishing": furnishing?.name,
        "constructionStatus": constructionStatus?.name,
        "listedBy": listedBy?.name,
        "superBuiltupAreaft": superBuiltupAreaft,
        "carpetAreaft": carpetAreaft,
        "totalFloors": totalFloors,
        "floorNo": floorNo,
        "carParking": carParking,
        "projectName": projectName,
        "description": description,
        "noOfReports": noOfReports,
        "phoneNumber": phoneNumber,
        "whatsAppNumber": whatsAppNumber,
        "plotArea": plotArea,
        "plotLength": plotLength,
        "plotBreadth": plotBreadth,
        "washRoom": washRoom,
        "pricePerstft": pricePerstft,
        "bhk": bhk,
        "keywords": keywords,
        "webBannerId": webBannerId,
        "reportReasons": reportReasons,
        "mobileBannerId": mobileBannerId,
      };

  static PropertyModel fromSnap(DocumentSnapshot<Map<String, dynamic>> snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    // log("etSelectedCategory(snapshot['propertyCategory']) ${getSelectedCategoryEnum(snapshot['propertyCategory'])}");
    return PropertyModel(
      id: snap.id,
      userId: snapshot['userId'],
      createDate: snapshot['createDate'],
      updateDate: snapshot['updateDate'],
      propertyCategory: getSelectedCategoryEnum(snapshot['propertyCategory']),
      propertyType: getSelectedTypeEnum(snapshot['propertyType']),
      propertyPrice: snapshot['propertyPrice'],
      propertyImage: snapshot['propertyImage'],
      propertyTitle: snapshot['propertyTitle'] ?? '',
      propertyDetils: snapshot['propertyDetils'] ?? '',
      propertyLocation: PlaceCell.fromMap(snapshot['propertyLocation']),
      bedRooms: snapshot['bedRooms'] ?? 0,
      bathRooms: snapshot['bathRooms'] ?? 0,
      furnishing: getSelectedFurnisherEnum(snapshot['furnishing']),
      constructionStatus:
          getConstructionStatusEnum(snapshot['constructionStatus']),
      listedBy: getSelectedListedByEnum(snapshot['listedBy']),
      superBuiltupAreaft: snapshot['superBuiltupAreaft'] ?? 0,
      carpetAreaft: snapshot['carpetAreaft'] ?? 0,
      totalFloors: snapshot['totalFloors'] ?? 0,
      floorNo: snapshot['floorNo'] ?? 0,
      carParking: snapshot['carParking'] ?? 0,
      projectName: snapshot['projectName'] ?? '',
      description: snapshot['description'] ?? '',
      noOfReports: snapshot['noOfReports'] ?? 0,
      phoneNumber: snapshot['phoneNumber'] ?? '',
      whatsAppNumber: snapshot['whatsAppNumber'] ?? '',
      plotArea: snapshot['plotArea'] ?? 0,
      plotLength: snapshot['plotLength'] ?? 0,
      plotBreadth: snapshot['plotBreadth'] ?? 0,
      washRoom: snapshot['washRoom'] ?? 0,
      pricePerstft: snapshot['pricePerstft'] ?? 0,
      bhk: snapshot['bhk'],
      keywords: snapshot['keywords'],
      webBannerId: snapshot['webBannerId'],
      reportReasons: snapshot['reportReasons'],
      mobileBannerId: snapshot['mobileBannerId'],
    );
  }

  String get getbhk {
    switch (bhk) {
      case 1:
        return '1+ BHK';
      case 2:
        return '2+ BHK';
      case 3:
        return '3+ BHK';
      case 4:
        return '4+ BHK';
    }
    return '';
  }

  static ConstructionStatus? getConstructionStatus(String? value) {
    switch (value) {
      case 'New Launch':
        return ConstructionStatus.newLaunch;
      case 'Ready To Move':
        return ConstructionStatus.readyToMove;
      case 'Under-Construction':
        return ConstructionStatus.underConstruction;
    }

    return null;
  }

  static ConstructionStatus? getConstructionStatusEnum(String? value) {
    switch (value) {
      case 'newLaunch':
        return ConstructionStatus.newLaunch;
      case 'readyToMove':
        return ConstructionStatus.readyToMove;
      case 'underConstruction':
        return ConstructionStatus.underConstruction;
    }

    return null;
  }

  String get getConstructionStatusString {
    switch (constructionStatus?.name) {
      case 'newLaunch':
        return 'New Launch';
      case 'readyToMove':
        return 'Ready To Move';
      case 'underConstruction':
        return 'Under-Construction';
    }
    return '';
  }

  static SelectedCategory? getSelectedCategory(String? value) {
    switch (value) {
      case 'House':
        return SelectedCategory.house;
      case 'Apartments':
        return SelectedCategory.apartments;
      case 'Lands/Plots':
        return SelectedCategory.landsPlots;
      case 'Commercial':
        return SelectedCategory.commercial;
      case 'Co-Working Space':
        return SelectedCategory.coWorkingSpace;
      case 'PG & Guest House':
        return SelectedCategory.pGGuestHouse;
    }

    return null;
  }

  static SelectedCategory? getSelectedCategoryEnum(String? vale) {
    switch (vale) {
      case 'house':
        return SelectedCategory.house;
      case 'apartments':
        return SelectedCategory.apartments;
      case 'landsPlots':
        return SelectedCategory.landsPlots;
      case 'commercial':
        return SelectedCategory.commercial;
      case 'coWorkingSpace':
        return SelectedCategory.coWorkingSpace;
      case 'pGGuestHouse':
        return SelectedCategory.pGGuestHouse;
    }
    return null;
  }

  String get getSelectedCategoryString {
    switch (propertyCategory?.name) {
      case 'house':
        return 'House';
      case 'apartments':
        return 'Apartments';
      case 'landsPlots':
        return 'Lands/Plots';
      case 'commercial':
        return 'Commercial';
      case 'coWorkingSpace':
        return 'Co-Working Space';
      case 'pGGuestHouse':
        return 'PG & Guest House';
    }
    return '';
  }

  static SelectedType? getSelectedType(String? value) {
    switch (value) {
      case 'Sell':
        return SelectedType.sell;
      case 'Rent':
        return SelectedType.rent;
    }

    return null;
  }

  static SelectedType? getSelectedTypeEnum(String? value) {
    switch (value) {
      case 'sell':
        return SelectedType.sell;
      case 'rent':
        return SelectedType.rent;
    }

    return null;
  }

  String get getSelectedTypeString {
    switch (propertyType?.name) {
      case 'sell':
        return 'Sell';

      case 'rent':
        return 'Rent';
    }
    return '';
  }

  static SelectedFurnisher? getSelectedFurnisher(String? value) {
    switch (value) {
      case 'Furnished':
        return SelectedFurnisher.furnished;
      case 'Semi-Furnished':
        return SelectedFurnisher.semiFurnished;
      case 'Un-Furnished':
        return SelectedFurnisher.unFurnished;
    }

    return null;
  }

  static SelectedFurnisher? getSelectedFurnisherEnum(String? value) {
    switch (value) {
      case 'furnished':
        return SelectedFurnisher.furnished;
      case 'semiFurnished':
        return SelectedFurnisher.semiFurnished;
      case 'unFurnished':
        return SelectedFurnisher.unFurnished;
    }

    return null;
  }

  String get getSelectedFurnisherString {
    switch (furnishing?.name) {
      case 'furnished':
        return 'Furnished';
      case 'semiFurnished':
        return 'Semi-Furnished';
      case 'unFurnished':
        return 'Un-Furnished';
    }
    return '';
  }

  static SelectedListedBy? getSelectedListedBy(String? value) {
    switch (value) {
      case 'Builder':
        return SelectedListedBy.builder;
      case 'Dealer':
        return SelectedListedBy.dealer;
      case 'Owner':
        return SelectedListedBy.owner;
    }

    return null;
  }

  static SelectedListedBy? getSelectedListedByEnum(String? value) {
    switch (value) {
      case 'builder':
        return SelectedListedBy.builder;
      case 'dealer':
        return SelectedListedBy.dealer;
      case 'owner':
        return SelectedListedBy.owner;
    }

    return null;
  }

  String get getSelectedListedByString {
    switch (listedBy?.name) {
      case 'builder':
        return 'Builder';
      case 'dealer':
        return 'Dealer';
      case 'owner':
        return 'Owner';
    }
    return '';
  }

  PropertyModel copyWith({
    String? id,
    String? userId,
    Timestamp? createDate,
    Timestamp? updateDate,
    SelectedCategory? propertyCategory,
    SelectedType? propertyType,
    int? propertyPrice,
    List? propertyImage,
    String? propertyTitle,
    String? propertyDetils,
    PlaceCell? propertyLocation,
    int? bedRooms,
    int? bathRooms,
    SelectedFurnisher? furnishing,
    ConstructionStatus? constructionStatus,
    SelectedListedBy? listedBy,
    int? superBuiltupAreaft,
    int? carpetAreaft,
    int? totalFloors,
    int? floorNo,
    int? carParking,
    String? projectName,
    String? description,
    int? noOfReports,
    String? phoneNumber,
    String? whatsAppNumber,
    int? plotArea,
    int? plotLength,
    int? plotBreadth,
    int? washRoom,
    int? pricePerstft,
    int? bhk,
    List? keywords,
    String? webBannerId,
    List? reportReasons,
    String? mobileBannerId,
  }) {
    return PropertyModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      propertyCategory: propertyCategory ?? this.propertyCategory,
      propertyType: propertyType ?? this.propertyType,
      propertyPrice: propertyPrice ?? this.propertyPrice,
      propertyImage: propertyImage ?? this.propertyImage,
      propertyTitle: propertyTitle ?? this.propertyTitle,
      propertyDetils: propertyDetils ?? this.propertyDetils,
      propertyLocation: propertyLocation ?? this.propertyLocation,
      bedRooms: bedRooms ?? this.bedRooms,
      bathRooms: bathRooms ?? this.bathRooms,
      furnishing: furnishing ?? this.furnishing,
      constructionStatus: constructionStatus ?? this.constructionStatus,
      listedBy: listedBy ?? this.listedBy,
      superBuiltupAreaft: superBuiltupAreaft ?? this.superBuiltupAreaft,
      carpetAreaft: carpetAreaft ?? this.carpetAreaft,
      totalFloors: totalFloors ?? this.totalFloors,
      floorNo: floorNo ?? this.floorNo,
      carParking: carParking ?? this.carParking,
      projectName: projectName ?? this.projectName,
      description: description ?? this.description,
      noOfReports: noOfReports ?? this.noOfReports,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      whatsAppNumber: whatsAppNumber ?? this.whatsAppNumber,
      plotArea: plotArea ?? this.plotArea,
      plotLength: plotLength ?? this.plotLength,
      plotBreadth: plotBreadth ?? this.plotBreadth,
      washRoom: washRoom ?? this.washRoom,
      pricePerstft: pricePerstft ?? this.pricePerstft,
      bhk: bhk ?? this.bhk,
      keywords: keywords ?? this.keywords,
      webBannerId: webBannerId,
      reportReasons: reportReasons ?? this.reportReasons,
      mobileBannerId: mobileBannerId,
    );
  }
}
