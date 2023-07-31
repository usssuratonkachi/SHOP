import 'package:shop/data/access_key_storage/base_access_key_storage.dart';

mixin AccessKey on BaseAccessKeyStorage {
  static const accessKey = 'accessKey';

  setAccessKey(String? accessKeyValue) {
    sharedPreferences.setString(accessKey, '$accessKeyValue');
  }

  String? getAccessKey() {
    return sharedPreferences.getString(accessKey);
  }

}
