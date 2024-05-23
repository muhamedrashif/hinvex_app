// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart' as _i10;
import 'package:firebase_messaging/firebase_messaging.dart' as _i9;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../features/authentication/data/i_auth_facade.dart' as _i14;
import '../../features/authentication/repo/i_auth_imlp.dart' as _i15;
import '../../features/home/data/i_home_facade.dart' as _i24;
import '../../features/home/repo/i_home_impl.dart' as _i25;
import '../../features/location/data/i_location_facade.dart' as _i27;
import '../../features/location/repo/i_location_impl.dart' as _i26;
import '../../features/myads/data/i_myads_facade.dart' as _i18;
import '../../features/myads/repo/i_myads_impl.dart' as _i19;
import '../../features/notification/data/i_notification_facade.dart' as _i22;
import '../../features/notification/repo/i_notification_impl.dart' as _i23;
import '../../features/profile/data/i_profile_facade.dart' as _i28;
import '../../features/profile/repo/i_profile_impl.dart' as _i29;
import '../../features/property_details_view/data/i_propertydetails_facade.dart'
    as _i20;
import '../../features/property_details_view/repo/i_propertydetails_impl.dart'
    as _i21;
import '../../features/sell/data/i_sell_facade.dart' as _i30;
import '../../features/sell/repo/i_sell_impl.dart' as _i31;
import '../../features/shortlists/data/i_shortlist_facade.dart' as _i16;
import '../../features/shortlists/repo/i_shortlist_impl.dart' as _i17;
import '../services/dynamic_link_services.dart' as _i5;
import '../services/image_pick_service.dart' as _i12;
import '../services/location_service.dart' as _i11;
import '../services/upload_location_services.dart' as _i13;
import 'app_injectable_module.dart' as _i32;
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
  gh.lazySingleton<_i5.DynamicLinkServices>(
      () => appInjectableModule.dynamicLink);
  gh.lazySingleton<_i6.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i7.FirebaseStorage>(
      () => firebaseInjectableModule.firebaseDtorage);
  gh.lazySingleton<_i8.FirebaseAuth>(() => firebaseInjectableModule.auth);
  gh.lazySingleton<_i9.FirebaseMessaging>(
      () => firebaseInjectableModule.messaging);
  gh.lazySingleton<_i10.FirebaseDynamicLinks>(
      () => firebaseInjectableModule.dynamicLink);
  gh.lazySingleton<_i11.GetPosition>(() => _i11.GetPosition());
  gh.lazySingleton<_i12.ImageService>(
      () => _i12.ImageService(gh<_i7.FirebaseStorage>()));
  gh.lazySingleton<_i13.UploadPlaceService>(
      () => _i13.UploadPlaceService(gh<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i14.IAuthFacade>(() => _i15.IAuthImpl(
        gh<_i8.FirebaseAuth>(),
        gh<_i6.FirebaseFirestore>(),
        gh<_i9.FirebaseMessaging>(),
      ));
  gh.lazySingleton<_i16.IShortListFacade>(
      () => _i17.IShortListImpl(gh<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i18.IMyAdsFacade>(() => _i19.IMyAdsImpl(
        gh<_i6.FirebaseFirestore>(),
        gh<_i8.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i20.IPropertyDetailsFacade>(
      () => _i21.IPropertyDetailsImpl(gh<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i22.INotificationFacade>(
      () => _i23.INotificationImpl(gh<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i24.IHomeFacade>(
      () => _i25.IHomeImpl(gh<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i26.GetCurrentPosition>(() => _i26.GetCurrentPosition(
        gh<_i11.GetPosition>(),
        gh<_i3.SharedPreferences>(),
        gh<_i13.UploadPlaceService>(),
      ));
  gh.lazySingleton<_i27.ILocationFacade>(() => _i26.ILocationImpl(
        gh<_i6.FirebaseFirestore>(),
        gh<_i26.GetCurrentPosition>(),
        gh<_i3.SharedPreferences>(),
        gh<_i13.UploadPlaceService>(),
      ));
  gh.lazySingleton<_i28.IProfileFacade>(() => _i29.IProfileImpl(
        gh<_i6.FirebaseFirestore>(),
        gh<_i13.UploadPlaceService>(),
        gh<_i26.GetCurrentPosition>(),
        gh<_i12.ImageService>(),
      ));
  gh.lazySingleton<_i30.ISellFacade>(() => _i31.ISellImpl(
        gh<_i6.FirebaseFirestore>(),
        gh<_i13.UploadPlaceService>(),
        gh<_i26.GetCurrentPosition>(),
      ));
  return getIt;
}

class _$AppInjectableModule extends _i32.AppInjectableModule {}

class _$FirebaseInjectableModule extends _i4.FirebaseInjectableModule {}
