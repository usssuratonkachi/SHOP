import 'package:shop/data/access_key_storage/access_key_mixin.dart';
import 'package:shop/data/access_key_storage/base_access_key_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessKeyStorage extends BaseAccessKeyStorage with AccessKey{
  const AccessKeyStorage(SharedPreferences sharedPreferences) : super(sharedPreferences);
}