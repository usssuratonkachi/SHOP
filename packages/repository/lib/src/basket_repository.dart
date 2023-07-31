import 'package:api/api.dart';
import 'package:shop/data/access_key_storage/access_key_storage.dart';
import 'package:shop/data/mappers/mappers.dart';

import '../repository.dart';

class BasketRepository {
  BasketRepository({
    required this.basketMapper,
    required this.accessKeyStorage,
    BasketApiClient? basketApiClient,
  }) : _basketApiClient = basketApiClient ?? BasketApiClient();

  final BasketApiClient _basketApiClient;
  final BasketMapper basketMapper;
  final AccessKeyStorage accessKeyStorage;

  Future<BasketModel> getBasket() async {
    final basket =
        await _basketApiClient.getBasket(accessKeyStorage.getAccessKey());
    return basketMapper.map(basket);
  }

  Future<void> postToBasket({required productId}) async {
    await _basketApiClient.postToBasket(
        userAccessKey: accessKeyStorage.getAccessKey(), productId: productId);
  }

  Future<void> changeQuantity({required productId, required quantity}) async {
    await _basketApiClient.changeQuantity(
        userAccessKey: accessKeyStorage.getAccessKey(),
        productId: productId,
        quantity: quantity);
  }

  Future<void> deleteProductFromBasket({required productId}) async {
    await _basketApiClient.deleteProductFromBasket(
        userAccessKey: accessKeyStorage.getAccessKey(), productId: productId);
  }
}
