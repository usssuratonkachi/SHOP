import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:repository/repository.dart';
import 'package:shop/data/models/item_model/item.dart';


part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit(this._itemRepository, this._productCategoriesRepository)
      : super(ItemState());

  final ItemRepository _itemRepository;
  final ProductCategoriesRepository _productCategoriesRepository;
  ListProductCategoriesModel? listProductCategories;

  Future<void> fetchItem({required offset}) async {
    emit(state.copyWith(status: ItemStatus.loading));

    try {
      final itemList = ItemList.fromRepository(
        await _itemRepository.getListItems(offset: offset),
      );

      emit(
        state.copyWith(status: ItemStatus.success, itemList: itemList),
      );
    } on Exception {
      emit(state.copyWith(status: ItemStatus.failure));
    }

  }

  fetchProductCategories() async {
    final productCategoriesList =
        await _productCategoriesRepository.getListProductCategories();
    emit(state.copyWith(listProductCategories: productCategoriesList));

  }


}
