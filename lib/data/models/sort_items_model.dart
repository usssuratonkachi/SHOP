import 'package:repository/repository.dart';
import 'package:repository/repository.dart' as sort_item_repository;

class SortItemsList {
  const SortItemsList({
    required this.items,
  });

  final List<Item> items;

  factory SortItemsList.fromRepository(sort_item_repository.ListItemsModel? list) {
    return SortItemsList(items: list!.items);
  }

  SortItemsList copyWith({
    List<Item>? items,
  }) {
    return SortItemsList(
      items: items ?? this.items,
    );
  }

  static final empty = SortItemsList(
    items: List.empty(),
  );
}
