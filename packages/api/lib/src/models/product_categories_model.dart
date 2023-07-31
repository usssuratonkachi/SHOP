import 'package:json_annotation/json_annotation.dart';

part 'product_categories_model.g.dart';

@JsonSerializable()
class ApiListProductCategoriesModel {
  const ApiListProductCategoriesModel({required this.items});

  final List<ApiProductCategoriesModel> items;

  factory ApiListProductCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$ApiListProductCategoriesModelFromJson(json);
}

@JsonSerializable()
class ApiProductCategoriesModel {
  const ApiProductCategoriesModel(
      {required this.id, required this.title, required this.slug});

  final int? id;
  final String? title;
  final String? slug;

  factory ApiProductCategoriesModel.fromJson(Map<String, dynamic> json) => _$ApiProductCategoriesModelFromJson(json);
}
