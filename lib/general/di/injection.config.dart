// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_messaging/firebase_messaging.dart' as _i8;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../../features/authentication/data/i_auth_facade.dart' as _i11;
import '../../features/authentication/repo/i_auth_imlp.dart' as _i12;
import '../../features/location/data/i_location_facade.dart' as _i14;
import '../../features/location/repo/i_location_impl.dart' as _i13;
import '../services/location_service.dart' as _i9;
import '../services/upload_location_services.dart' as _i10;
import 'app_injectable_module.dart' as _i15;
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
  final appInjectableModule = _$AppInjectableModule();
  await gh.factoryAsync<_i3.FirebaseServeice>(
    () => firebaseInjectableModule.firebaseServeice,
    preResolve: true,
  );
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => appInjectableModule.pref,
    preResolve: true,
  );
  gh.lazySingleton<_i5.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i6.FirebaseStorage>(
      () => firebaseInjectableModule.firebaseDtorage);
  gh.lazySingleton<_i7.FirebaseAuth>(() => firebaseInjectableModule.auth);
  gh.lazySingleton<_i8.FirebaseMessaging>(
      () => firebaseInjectableModule.messaging);
  gh.lazySingleton<_i9.GetPosition>(() => _i9.GetPosition());
  gh.lazySingleton<_i10.UploadPlaceService>(
      () => _i10.UploadPlaceService(gh<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i11.IAuthFacade>(() => _i12.IAuthImpl(
        gh<_i7.FirebaseAuth>(),
        gh<_i5.FirebaseFirestore>(),
        gh<_i8.FirebaseMessaging>(),
      ));
  gh.lazySingleton<_i13.GetCurrentPosition>(() => _i13.GetCurrentPosition(
        gh<_i9.GetPosition>(),
        gh<_i4.SharedPreferences>(),
        gh<_i10.UploadPlaceService>(),
      ));
  gh.lazySingleton<_i14.ILocationFacade>(() => _i13.ILocationImpl(
        gh<_i13.GetCurrentPosition>(),
        gh<_i4.SharedPreferences>(),
        gh<_i10.UploadPlaceService>(),
      ));
  return getIt;
}

class _$FirebaseInjectableModule extends _i3.FirebaseInjectableModule {}

class _$AppInjectableModule extends _i15.AppInjectableModule {}
