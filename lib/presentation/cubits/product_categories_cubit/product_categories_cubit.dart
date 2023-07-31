import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repository/repository.dart';

part 'product_categories_state.dart';

class ProductCategoriesCubit extends Cubit<ProductCategoriesState> {
  ProductCategoriesCubit(this._productCategoriesRepository)
      : super(const ProductCategoriesState());

  final ProductCategoriesRepository _productCategoriesRepository;

  Future<void> fetchProductCategories() async{
    emit(state.copyWith(status: ProductCategoriesStatus.loading));

    try{
      final productCategoriesList = await _productCategoriesRepository.getListProductCategories();
      emit(state.copyWith(status: ProductCategoriesStatus.success, productCategoriesList: productCategoriesList));
    } on Exception{
      emit(state.copyWith(status: ProductCategoriesStatus.failure));
    }
  }
}
