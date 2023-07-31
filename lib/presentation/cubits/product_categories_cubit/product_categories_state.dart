part of 'product_categories_cubit.dart';


enum ProductCategoriesStatus { initial, loading, success, failure }

extension ItemStatusX on ProductCategoriesStatus{
  bool get isInitial => this == ProductCategoriesStatus.initial;

  bool get isLoading => this == ProductCategoriesStatus.loading;

  bool get isSuccess => this == ProductCategoriesStatus.success;

  bool get isFailure => this == ProductCategoriesStatus.failure;

}

class ProductCategoriesState extends Equatable {
  const ProductCategoriesState(
      {this.status = ProductCategoriesStatus.initial, this.productCategoriesList});

  final ProductCategoriesStatus status;
  final ListProductCategoriesModel? productCategoriesList;

  ProductCategoriesState copyWith(
      {ProductCategoriesStatus? status, ListProductCategoriesModel? productCategoriesList}){
    return ProductCategoriesState(status: status ?? this.status, productCategoriesList: productCategoriesList ?? this.productCategoriesList);
  }

  @override
  List<Object?> get props => [status, productCategoriesList];
}