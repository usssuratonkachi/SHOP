import 'package:api/api.dart';
import 'package:repository/repository.dart';
import 'mappers.dart';


class ProductCategoriesMapper
    extends Mapper<ApiProductCategoriesModel, ProductCategoriesModel> {
  @override
  ProductCategoriesModel map(ApiProductCategoriesModel? model) {
    return ProductCategoriesModel(
        id: model?.id, title: model?.title, slug: model?.slug);
  }
}

class ListProductCategoriesMapper
    extends Mapper<ApiListProductCategoriesModel, ListProductCategoriesModel> {
  ListProductCategoriesMapper({required this.productCategoriesMapper});

  final ProductCategoriesMapper productCategoriesMapper;

  @override
  ListProductCategoriesModel map(ApiListProductCategoriesModel? model) {
    final List<ApiProductCategoriesModel>? items = model?.items;
    return ListProductCategoriesModel(
        items:
            items != null ? productCategoriesMapper.mapList(model?.items) : []);
  }
}
