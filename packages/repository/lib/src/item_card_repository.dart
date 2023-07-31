import 'package:api/api.dart';
import 'package:shop/data/mappers/mappers.dart';

import '../repository.dart';

class ItemCardRepository {
  ItemCardRepository({required this.itemMapper, ItemCardApiClient? itemCardApiClient})
      : _itemCardApiClient = itemCardApiClient ?? ItemCardApiClient();

  final ItemCardApiClient _itemCardApiClient;
  final ItemMapper itemMapper;

  Future<Item?> getItemCard({required int? id}) async{

    final itemCard = await _itemCardApiClient.getItemCard(id: id);

    return itemMapper.map(itemCard);
  }
}
