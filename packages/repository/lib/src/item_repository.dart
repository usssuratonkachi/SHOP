import 'dart:async';

import 'package:api/api.dart';
import 'package:repository/repository.dart';
import 'package:shop/data/mappers/mappers.dart';

class ItemRepository{

  ItemRepository({ required this.listItemsMapper, ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  final ListItemsMapper listItemsMapper;

  Future<ListItemsModel?> getListItems({required offset}) async{

    final listItems = await _apiClient.getListItems(offset: offset);

    return listItemsMapper.map(listItems);
  }
}