// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'search_location_model/search_location_model.dart';

class UserModel {
  String? id;
  String? userId;
  String? userName;
  String? userPhoneNumber;
  String? userWhatsAppNumber;
  String? userImage;
  int? totalPosts;
  PlaceCell? userLocation;
  String? partnership;
  bool? isBlocked;
  String? notificationToken;

  UserModel({
    this.id,
    this.userId,
    this.userName,
    this.userPhoneNumber,
    this.userWhatsAppNumber,
    this.userImage,
    this.totalPosts,
    this.userLocation,
    this.partnership,
    this.isBlocked,
    this.notificationToken,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "userName": userName,
        "userPhoneNumber": userPhoneNumber,
        "userWhatsAppNumber": userWhatsAppNumber,
        "userImage": userImage,
        "totalPosts": totalPosts,
        "userLocation": userLocation!.toMap(),
        "partnership": partnership,
        "isBlocked": isBlocked,
        'notificationToken': notificationToken,
      };
  static UserModel fromSnap(DocumentSnapshot<Map<String, dynamic>> snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snap.id,
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      userPhoneNumber: snapshot['userPhoneNumber'],
      userWhatsAppNumber: snapshot['userWhatsAppNumber'],
      userImage: snapshot['userImage'],
      totalPosts: snapshot['totalPosts'],
      userLocation: PlaceCell.fromMap(snapshot['userLocation']),
      partnership: snapshot['partnership'],
      isBlocked: snapshot['isBlocked'],
      notificationToken: snapshot['notificationToken'],
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
    String? partnership,
    bool? isBlocked,
    String? notificationToken,
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
      partnership: partnership ?? this.partnership,
      isBlocked: isBlocked ?? this.isBlocked,
      notificationToken: notificationToken ?? this.notificationToken,
    );
  }
}
