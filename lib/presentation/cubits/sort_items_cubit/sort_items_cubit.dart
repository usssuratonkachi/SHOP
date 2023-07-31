import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

part 'sort_items_state.dart';

class SortItemsCubit extends Cubit<SortItemsState> {
  SortItemsCubit(this._sortItemsRepository, this.categoryId, this.categoryName)
      : super(const SortItemsState());

  final SortItemsRepository _sortItemsRepository;
  final int? categoryId;
  final String? categoryName;

  Future<void> fetchSortItems({required categoryId}) async {
    emit(state.copyWith(status: SortItemsStatus.loading));

    try {
      final sortItemList =
      await _sortItemsRepository.getSortListItems(categoryId: categoryId);
      emit(state.copyWith(
          status: SortItemsStatus.success, itemList: sortItemList, categoryId: categoryId, categoryName: categoryName));
    }
    on Exception{
      emit(state.copyWith(status: SortItemsStatus.failure));
    }
  }
}
