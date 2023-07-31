part of 'sort_items_cubit.dart';

enum SortItemsStatus { initial, loading, success, failure }

extension SortItemsStatusX on SortItemsStatus {
  bool get isInitial => this == SortItemsStatus.initial;

  bool get isLoading => this == SortItemsStatus.loading;

  bool get isSuccess => this == SortItemsStatus.success;

  bool get isFailure => this == SortItemsStatus.failure;
}

class SortItemsState extends Equatable {
  const SortItemsState(
      {this.status = SortItemsStatus.initial,
      this.itemList,
      this.categoryName,
      this.categoryId});

  final SortItemsStatus status;
  final ListItemsModelWithoutPagination? itemList;
  final int? categoryId;
  final String? categoryName;

  SortItemsState copyWith({
    SortItemsStatus? status,
    ListItemsModelWithoutPagination? itemList,
    int? categoryId,
    String? categoryName,
  }) {
    return SortItemsState(
        status: status ?? this.status,
        itemList: itemList ?? this.itemList,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName);
  }

  @override
  List<Object?> get props => [status, itemList, categoryName, categoryId];
}
