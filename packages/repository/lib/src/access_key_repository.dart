import 'package:api/api.dart';
import 'package:shop/data/access_key_storage/access_key_storage.dart';

class AccessKeyRepository {
  AccessKeyRepository({required this.accessKeyStorage});

  final AccessKeyStorage accessKeyStorage;

  setAccessKey() async {
    final accessKey = await AccessKeyApiClient().getUserAccessKey();
    return accessKeyStorage.setAccessKey(accessKey);
  }

  String? getAccessKey(){
    return accessKeyStorage.getAccessKey();
  }
}
