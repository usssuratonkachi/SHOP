
part of 'item_card_cubit.dart';

enum ItemCardStatus { initial, loading, success, failure }

extension ItemCardStatusX on ItemCardStatus {
  bool get isInitial => this == ItemCardStatus.initial;

  bool get isLoading => this == ItemCardStatus.loading;

  bool get isSuccess => this == ItemCardStatus.success;

  bool get isFailure => this == ItemCardStatus.failure;
}


class ItemCardState extends Equatable {
  const ItemCardState({
    this.status = ItemCardStatus.initial,
    this.item
  });

  final ItemCardStatus status;
  final Item? item;

  ItemCardState copyWith({
    ItemCardStatus? status,
    Item? item,
  }) {
    return ItemCardState(
      status: status ?? this.status,
      item: item ?? this.item,
    );
  }


  @override
  List<Object?> get props => [status, item];
}
