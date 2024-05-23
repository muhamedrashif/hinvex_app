// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hinvex_app/features/location/data/model/search_location_model/search_location_model.dart';

class UserModel {
  String? id;
  String? userId;
  String? userName;
  String? userPhoneNumber;
  String? userWhatsAppNumber;
  String? userImage;
  int? totalPosts;
  PlaceCell? userLocation;
  // String? partnership;
  bool? isBlocked;
  String? notificationToken;
  Timestamp? startedDate;
  List<String>? favoriteProducts;

  UserModel({
    this.id,
    this.userId,
    this.userName,
    this.userPhoneNumber,
    this.userWhatsAppNumber,
    this.userImage,
    this.totalPosts,
    this.userLocation,
    // this.partnership,
    this.isBlocked,
    this.notificationToken,
    this.startedDate,
    this.favoriteProducts,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "userName": userName,
        "userPhoneNumber": userPhoneNumber,
        "userWhatsAppNumber": userWhatsAppNumber,
        "userImage": userImage,
        "totalPosts": totalPosts,
        "userLocation": userLocation?.toMap(),
        // // "partnership": partnership,
        "isBlocked": isBlocked,
        'notificationToken': notificationToken,
        'startedDate': startedDate,
        'favoriteProducts': favoriteProducts,
      };
  static UserModel fromSnap(DocumentSnapshot<Map<String, dynamic>> snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot['id'],
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      userPhoneNumber: snapshot['userPhoneNumber'],
      userWhatsAppNumber: snapshot['userWhatsAppNumber'],
      userImage: snapshot['userImage'],
      totalPosts: snapshot['totalPosts'],
      userLocation: PlaceCell.fromMap(snapshot['userLocation']),
      // // partnership: snapshot['partnership'],
      isBlocked: snapshot['isBlocked'],
      notificationToken: snapshot['notificationToken'],
      startedDate: snapshot['startedDate'],
      favoriteProducts: List<String>.from(snapshot['favoriteProducts']),
    );
  }

  UserModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userPhoneNumber,
    String? userWhatsAppNumber,
    String? userImage,
    int? totalPosts,
    PlaceCell? userLocation,
    // String? partnership,
    bool? isBlocked,
    String? notificationToken,
    Timestamp? startedDate,
    List<String>? favoriteProducts,
  }) {
    return UserModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      userWhatsAppNumber: userWhatsAppNumber ?? this.userWhatsAppNumber,
      userImage: userImage ?? this.userImage,
      totalPosts: totalPosts ?? this.totalPosts,
      userLocation: userLocation ?? this.userLocation,
      // // // partnership: partnership ?? this.partnership,
      isBlocked: isBlocked ?? this.isBlocked,
      notificationToken: notificationToken ?? this.notificationToken,
      startedDate: startedDate ?? this.startedDate,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'userName': userName,
      'userPhoneNumber': userPhoneNumber,
      'userWhatsAppNumber': userWhatsAppNumber,
      'userImage': userImage,
      'totalPosts': totalPosts,
      'userLocation': userLocation?.toMap(),
      // // 'partnership': partnership,
      'isBlocked': isBlocked,
      'notificationToken': notificationToken,
      'startedDate': startedDate,
      'favoriteProducts': favoriteProducts,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      userPhoneNumber: map['userPhoneNumber'] != null
          ? map['userPhoneNumber'] as String
          : null,
      userWhatsAppNumber: map['userWhatsAppNumber'] != null
          ? map['userWhatsAppNumber'] as String
          : null,
      userImage: map['userImage'] != null ? map['userImage'] as String : null,
      totalPosts: map['totalPosts'] != null ? map['totalPosts'] as int : null,
      userLocation: map['userLocation'] != null
          ? PlaceCell.fromMap(map['userLocation'] as Map<String, dynamic>)
          : null,
      // partnership:
      // // map['partnership'] != null ? map['partnership'] as String : null,
      isBlocked: map['isBlocked'] != null ? map['isBlocked'] as bool : null,
      notificationToken: map['notificationToken'] != null
          ? map['notificationToken'] as String
          : null,
      startedDate:
          map['startedDate'] != null ? map['startedDate'] as Timestamp : null,
      favoriteProducts: map['favoriteProducts'] != null
          ? List<String>.from(map['favoriteProducts'])
          : null,
    );
  }
}
