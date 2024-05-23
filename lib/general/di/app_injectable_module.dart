import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hinvex_app/general/di/injection.dart';
import 'package:hinvex_app/general/services/dynamic_link_services.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppInjectableModule {
  // ignore: invalid_annotation_target
  @preResolve
  Future<SharedPreferences> get pref => SharedPreferences.getInstance();

  @lazySingleton
  DynamicLinkServices get dynamicLink =>
      DynamicLinkServices(sl<FirebaseDynamicLinks>(),sl<FirebaseFirestore>());
}
