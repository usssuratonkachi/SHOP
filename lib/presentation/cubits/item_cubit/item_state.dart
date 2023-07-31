part of 'item_cubit.dart';

enum ItemStatus { initial, loading, success, failure }

extension ItemStatusX on ItemStatus {
  bool get isInitial => this == ItemStatus.initial;

  bool get isLoading => this == ItemStatus.loading;

  bool get isSuccess => this == ItemStatus.success;

  bool get isFailure => this == ItemStatus.failure;
}

@JsonSerializable()
class ItemState extends Equatable {
  const ItemState({
    this.status = ItemStatus.initial,
    this.itemList,
    this.listProductCategories,
  });

  final ItemStatus status;
  final ItemList? itemList;
  final ListProductCategoriesModel? listProductCategories;

  ItemState copyWith({
    ItemStatus? status,
    ItemList? itemList,
    ListProductCategoriesModel? listProductCategories
  }) {
    return ItemState(
      status: status ?? this.status,
      itemList: itemList ?? this.itemList,
      listProductCategories: listProductCategories ?? this.listProductCategories,
    );
  }


  @override
  List<Object?> get props => [status, itemList, listProductCategories];
}
