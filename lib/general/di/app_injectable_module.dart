import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppInjectableModule {
  // ignore: invalid_annotation_target
  @preResolve
  Future<SharedPreferences> get pref => SharedPreferences.getInstance();
}
