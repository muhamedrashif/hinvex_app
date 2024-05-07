// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i7;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/authentication/data/i_auth_facade.dart' as _i8;
import '../../features/authentication/repo/i_auth_imlp.dart' as _i9;
import 'firebase_injectable_module.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  await gh.factoryAsync<_i3.FirebaseServeice>(
    () => firebaseInjectableModule.firebaseServeice,
    preResolve: true,
  );
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.FirebaseStorage>(
      () => firebaseInjectableModule.firebaseDtorage);
  gh.lazySingleton<_i6.FirebaseAuth>(() => firebaseInjectableModule.auth);
  gh.lazySingleton<_i7.FirebaseMessaging>(
      () => firebaseInjectableModule.messaging);
  gh.lazySingleton<_i8.IAuthFacade>(() => _i9.IAuthImpl(
        gh<_i6.FirebaseAuth>(),
        gh<_i4.FirebaseFirestore>(),
        gh<_i7.FirebaseMessaging>(),
      ));
  return getIt;
}

class _$FirebaseInjectableModule extends _i3.FirebaseInjectableModule {}
