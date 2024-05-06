import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:injectable/injectable.dart';

@module
abstract class FirebaseInjectableModule {
  // ignore: invalid_annotation_target
  @preResolve
  Future<FirebaseServeice> get firebaseServeice => FirebaseServeice.init();

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @lazySingleton
  FirebaseStorage get firebaseDtorage => FirebaseStorage.instance;

  @lazySingleton
  FirebaseAuth get auth => FirebaseAuth.instance;
}

class FirebaseServeice {
  static Future<FirebaseServeice> init() async {
    // await Firebase.initializeApp(
    //   options:
    // );  //TODO:ADD FIRABASE
    return FirebaseServeice();
  }
}
