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
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/authentication/data/i_auth_facade.dart' as _i12;
import '../../features/authentication/repo/i_auth_imlp.dart' as _i13;
import '../../features/home/data/i_home_facade.dart' as _i18;
import '../../features/home/repo/i_home_impl.dart' as _i19;
import '../../features/location/data/i_location_facade.dart' as _i21;
import '../../features/location/repo/i_location_impl.dart' as _i20;
import '../../features/myads/data/i_myads_facade.dart' as _i14;
import '../../features/myads/repo/i_myads_impl.dart' as _i15;
import '../../features/profile/data/i_profile_facade.dart' as _i22;
import '../../features/profile/repo/i_profile_impl.dart' as _i23;
import '../../features/property_details_view/data/i_propertydetails_facade.dart'
    as _i16;
import '../../features/property_details_view/repo/i_propertydetails_impl.dart'
    as _i17;
import '../../features/sell/data/i_sell_facade.dart' as _i24;
import '../../features/sell/repo/i_sell_impl.dart' as _i25;
import '../services/image_pick_service.dart' as _i10;
import '../services/location_service.dart' as _i9;
import '../services/upload_location_services.dart' as _i11;
import 'app_injectable_module.dart' as _i26;
import 'firebase_injectable_module.dart' as _i4;

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
  final appInjectableModule = _$AppInjectableModule();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => appInjectableModule.pref,
    preResolve: true,
  );
  await gh.factoryAsync<_i4.FirebaseServeice>(
    () => firebaseInjectableModule.firebaseServeice,
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
  gh.lazySingleton<_i10.ImageService>(
      () => _i10.ImageService(gh<_i6.FirebaseStorage>()));
  gh.lazySingleton<_i11.UploadPlaceService>(
      () => _i11.UploadPlaceService(gh<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i12.IAuthFacade>(() => _i13.IAuthImpl(
        gh<_i7.FirebaseAuth>(),
        gh<_i5.FirebaseFirestore>(),
        gh<_i8.FirebaseMessaging>(),
      ));
  gh.lazySingleton<_i14.IMyAdsFacade>(() => _i15.IMyAdsImpl(
        gh<_i5.FirebaseFirestore>(),
        gh<_i7.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i16.IPropertyDetailsFacade>(
      () => _i17.IPropertyDetailsImpl(gh<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i18.IHomeFacade>(
      () => _i19.IHomeImpl(gh<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i20.GetCurrentPosition>(() => _i20.GetCurrentPosition(
        gh<_i9.GetPosition>(),
        gh<_i3.SharedPreferences>(),
        gh<_i11.UploadPlaceService>(),
      ));
  gh.lazySingleton<_i21.ILocationFacade>(() => _i20.ILocationImpl(
        gh<_i5.FirebaseFirestore>(),
        gh<_i20.GetCurrentPosition>(),
        gh<_i3.SharedPreferences>(),
        gh<_i11.UploadPlaceService>(),
      ));
  gh.lazySingleton<_i22.IProfileFacade>(() => _i23.IProfileImpl(
        gh<_i5.FirebaseFirestore>(),
        gh<_i11.UploadPlaceService>(),
        gh<_i20.GetCurrentPosition>(),
        gh<_i10.ImageService>(),
      ));
  gh.lazySingleton<_i24.ISellFacade>(() => _i25.ISellImpl(
        gh<_i5.FirebaseFirestore>(),
        gh<_i11.UploadPlaceService>(),
        gh<_i20.GetCurrentPosition>(),
      ));
  return getIt;
}

class _$AppInjectableModule extends _i26.AppInjectableModule {}

class _$FirebaseInjectableModule extends _i4.FirebaseInjectableModule {}
