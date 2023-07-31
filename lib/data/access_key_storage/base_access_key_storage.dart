import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseAccessKeyStorage{
  const BaseAccessKeyStorage(this.sharedPreferences);

  final SharedPreferences sharedPreferences;
}