import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/property_details_view/presentation/view/property_details_screen.dart';
import 'package:hinvex_app/features/sell/data/model/property_model.dart';
import 'package:hinvex_app/general/utils/app_details.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:hinvex_app/main.dart';

import 'package:share_plus/share_plus.dart';

class DynamicLinkServices {
  final FirebaseDynamicLinks _firebaseDynamicLinks;
  final FirebaseFirestore _firestore;
  DynamicLinkServices(this._firebaseDynamicLinks, this._firestore);

  //CREATE DYNAMIC LINK
  Future<void> createShareLink({required PropertyModel propertyModel}) async {
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse("https://hinvex.com/?id=${propertyModel.id}"),
        socialMetaTagParameters: SocialMetaTagParameters(
            imageUrl: Uri.parse(propertyModel.propertyImage!.first),
            title: propertyModel.propertyTitle,
            description: propertyModel.propertyDetils),
        uriPrefix: AppDetails.uriPrifix,
        androidParameters:
            const AndroidParameters(packageName: AppDetails.appPackageName),
        iosParameters: const IOSParameters(bundleId: AppDetails.bundleId),
      );

      final shortLink = await _firebaseDynamicLinks.buildShortLink(
          dynamicLinkParams,
          shortLinkType: ShortDynamicLinkType.short);
      await Share.share("${shortLink.shortUrl}",
          subject: propertyModel.propertyTitle);
    } catch (e) {
      log("ERROR IN DYNAMIC ✔:$e");
    }
  }

  //RECIVE DYNAMIC LINK
  Future<void> reciveDynamicLink(BuildContext context) async {
    //BACK GROUND sertvice
    final getLink = await _firebaseDynamicLinks.getInitialLink();
    if (getLink != null) {
      _handleDynamicLink(getLink);
    }
    //FORGOUND SERVICE
    _firebaseDynamicLinks.onLink.listen((dynamicLinkData) async {
      _handleDynamicLink(dynamicLinkData);
    }).onError((error) {
      showToast("Error:$error");
    });
  }

  //HANDLE DYNAMIC LINK
  Future<void> _handleDynamicLink(
      PendingDynamicLinkData dynamicLinkData) async {
    final deepLink = dynamicLinkData.link;

    final productId = deepLink.queryParameters['id'];
    if (productId != null) {
      final product = await _fetchProductById(productId);
      //NAVIGATE TO PRODUCT DETAILS SCREEN
      if (product != null) {
        Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
          builder: (_) => PropertyDetailsScren(propertyModel: product),
        ));
      }
    }
  }

  //fetch product by id
  Future<PropertyModel?> _fetchProductById(String id) async {
    try {
      final docSnap = await _firestore.collection('posts').doc(id).get();

      if (docSnap.exists) {
        return PropertyModel.fromSnap(docSnap);
      }
    } catch (ex) {
      log("ERROR IN FETCH PRODUCT BY ID:$ex");
    }
  }
}
