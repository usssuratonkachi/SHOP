
part of 'basket_cubit.dart';

enum BasketStatus { initial, loading, success, failure }

extension ItemCardStatusX on BasketStatus {
  bool get isInitial => this == BasketStatus.initial;

  bool get isLoading => this == BasketStatus.loading;

  bool get isSuccess => this == BasketStatus.success;

  bool get isFailure => this == BasketStatus.failure;
}

class BasketState extends Equatable {
  const BasketState({this.status = BasketStatus.initial, this.basket});

  final BasketStatus status;
  final BasketModel? basket;

  BasketState copyWith({
    BasketStatus? status,
    BasketModel? basket,
  }) {
    return BasketState(
      status: status ?? this.status,
      basket: basket ?? this.basket,
    );
  }

  @override
  List<Object?> get props => [status, basket];
}
