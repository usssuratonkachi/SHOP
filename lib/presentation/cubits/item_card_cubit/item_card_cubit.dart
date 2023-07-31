import 'package:bloc/bloc.dart';
import 'package:repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'item_card_state.dart';

class ItemCardCubit extends Cubit<ItemCardState> {
  ItemCardCubit(this._itemCardRepository, this.id) : super(const ItemCardState());

  final ItemCardRepository _itemCardRepository;
  final int? id;

  Future<Item?> fetchItemCard() async {
    emit(state.copyWith(status: ItemCardStatus.loading));
    try {
      final itemCard = await _itemCardRepository.getItemCard(id: id);
      emit(state.copyWith(status: ItemCardStatus.success, item: itemCard));
    } on Exception {
      emit(state.copyWith(status: ItemCardStatus.failure));
    }
  }
}
