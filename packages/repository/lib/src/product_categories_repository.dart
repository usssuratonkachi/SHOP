import 'package:api/api.dart';
import 'package:repository/src/models/product_categories_model.dart';
import 'package:shop/data/mappers/mappers.dart';

class ProductCategoriesRepository {
  ProductCategoriesRepository(
      {required this.listProductCategoriesMapper,
      ProductCategoriesApiClient? productCategoriesApiClient})
      : _productCategoriesApiClient =
            productCategoriesApiClient ?? ProductCategoriesApiClient();

  final ProductCategoriesApiClient _productCategoriesApiClient;
  final ListProductCategoriesMapper listProductCategoriesMapper;

  Future<ListProductCategoriesModel> getListProductCategories() async {
    final listProductCategories =
        await _productCategoriesApiClient.getListItems();


    return listProductCategoriesMapper.map(listProductCategories);
  }
}
