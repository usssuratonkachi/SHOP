import 'package:api/api.dart';
import 'package:shop/data/mappers/mappers.dart';

import '../repository.dart';

class SortItemsRepository {
  SortItemsRepository(
      {required this.listItemsMapper, SortItemsApiClient? sortItemsApiClient})
      : _sortItemsApiClient = sortItemsApiClient ?? SortItemsApiClient();

  final SortItemsApiClient _sortItemsApiClient;
  final ListItemsMapperWithoutPagination listItemsMapper;

  Future<ListItemsModelWithoutPagination?> getSortListItems(
      {required categoryId}) async {
    final listSortItems =
        await _sortItemsApiClient.getListSortItems(categoryId: categoryId);

    return listItemsMapper.map(listSortItems);
  }
}
