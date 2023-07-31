import 'package:repository/repository.dart';
import 'package:repository/repository.dart' as item_repository;

import '../pagination_model/pagination_model.dart';


class ItemList {
  const ItemList({
    required this.items,
    required this.pagination
  });

  final List<Item> items;
  final PaginationModel? pagination;

  factory ItemList.fromRepository(item_repository.ListItemsModel? list) {
    return ItemList(items: list!.items, pagination: list.pagination);
  }

  ItemList copyWith({
    List<Item>? items,
  }) {
    return ItemList(
      items: items ?? this.items,
      pagination: pagination ,
    );
  }

  static final empty = ItemList(
    items: List.empty(),
    pagination: const PaginationModel()
  );


}
