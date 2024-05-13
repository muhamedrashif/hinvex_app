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
  String? partnership;
  bool? isBlocked;
  String? notificationToken;
  Timestamp? startedDate;

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
    this.startedDate,
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
        "partnership": partnership,
        "isBlocked": isBlocked,
        'notificationToken': notificationToken,
        'startedDate': startedDate,
      };
  static UserModel fromSnap(Map<String, dynamic> snap) {
    // var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snap['id'],
      userId: snap['userId'],
      userName: snap['userName'] ?? '',
      userPhoneNumber: snap['userPhoneNumber'],
      userWhatsAppNumber: snap['userWhatsAppNumber'],
      userImage: snap['userImage'] ?? '',
      totalPosts: snap['totalPosts'] ?? 0,
      userLocation: PlaceCell.fromMap(snap['userLocation']),
      partnership: snap['partnership'] ?? '',
      isBlocked: snap['isBlocked'] ?? false,
      notificationToken: snap['notificationToken'],
      startedDate: snap['startedDate'],
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
    Timestamp? startedDate,
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
      startedDate: startedDate ?? this.startedDate,
    );
  }
}
