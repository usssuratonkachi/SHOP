import 'package:json_annotation/json_annotation.dart';

class ListProductCategoriesModel {
  const ListProductCategoriesModel({required this.items});

  final List<ProductCategoriesModel> items;
}

@JsonSerializable()
class ProductCategoriesModel {
  const ProductCategoriesModel(
      {required this.id, required this.title, required this.slug});

  final int? id;
  final String? title;
  final String? slug;
}
