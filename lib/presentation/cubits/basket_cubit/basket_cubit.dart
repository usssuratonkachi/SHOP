import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';



part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  BasketCubit(this._basketRepository) : super(const BasketState());

  final BasketRepository _basketRepository;

  Future<void> fetchBasket() async {
    emit(state.copyWith(status: BasketStatus.loading));

    try {
      final basket = await _basketRepository.getBasket();
      emit(state.copyWith(status: BasketStatus.success, basket: basket));
    } catch (e) {
      emit(state.copyWith(status: BasketStatus.failure));
    }
  }

  Future<void> postItemToBasket({required productId}) async {
    emit(state.copyWith(status: BasketStatus.loading));
    try {
      _basketRepository.postToBasket(productId: productId);
      emit(state.copyWith(status: BasketStatus.success));
    } catch (e) {
      emit(state.copyWith(status: BasketStatus.failure));
    }
  }

  Future<void> increaseQuantity({required productId, required quantity}) async {
    try {
      _basketRepository.changeQuantity(
          productId: productId, quantity: quantity + 1);
      final basket = await _basketRepository.getBasket();
      emit(state.copyWith(status: BasketStatus.success, basket: basket));
    } catch (e) {
      emit(state.copyWith(status: BasketStatus.failure));
    }
  }

  Future<void> decreaseQuantity({required productId, required quantity}) async {
    try {
      if (quantity != 1) {
        _basketRepository.changeQuantity(
            productId: productId, quantity: quantity - 1);
      } else {
        _basketRepository.deleteProductFromBasket(productId: productId);
      }
      final basket = await _basketRepository.getBasket();
      emit(state.copyWith(status: BasketStatus.success, basket: basket));
    } catch (e) {
      emit(state.copyWith(status: BasketStatus.failure));
    }
  }
}
