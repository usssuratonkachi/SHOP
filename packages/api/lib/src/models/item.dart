import 'package:api/src/models/pagination_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class ApiListItemsModel {
  const ApiListItemsModel({
    required this.pagination,
    required this.items,
  });

  final List<ApiItem> items;
  final ApiPaginationModel pagination;

  factory ApiListItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ApiListItemsModelFromJson(json);
}

@JsonSerializable()
class ApiListItemsModelWithoutPagination {
  const ApiListItemsModelWithoutPagination({
    required this.items,
  });

  final List<ApiItem> items;

  factory ApiListItemsModelWithoutPagination.fromJson(
          Map<String, dynamic> json) =>
      _$ApiListItemsModelWithoutPaginationFromJson(json);
}

@JsonSerializable()
class ApiItem {
  const ApiItem(
      {required this.id,
      required this.title,
      required this.slug,
      required this.image,
      required this.price,
      required this.colors});

  final int id;
  final String title;
  final String slug;
  final ApiImageModel image;
  final double price;
  final List<ApiColorsModel> colors;

  factory ApiItem.fromJson(Map<String, dynamic> json) =>
      _$ApiItemFromJson(json);

  Map<String, dynamic> toJson() => _$ApiItemToJson(this);
}

@JsonSerializable()
class ApiImageModel {
  const ApiImageModel({
    required this.file,
  });

  final ApiFileModel file;

  factory ApiImageModel.fromJson(Map<String, dynamic> json) =>
      _$ApiImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiImageModelToJson(this);
}

@JsonSerializable()
class ApiFileModel {
  const ApiFileModel({
    required this.url,
    required this.name,
    required this.originalName,
    required this.extension,
  });

  final String url;
  final String name;
  @JsonKey(name: "originalName")
  final String originalName;
  final String extension;

  factory ApiFileModel.fromJson(Map<String, dynamic> json) =>
      _$ApiFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiFileModelToJson(this);

}

@JsonSerializable()
class ApiColorsModel {
  const ApiColorsModel({
    required this.id,
    required this.title,
    required this.code,
  });

  final int id;
  final String title;
  final String code;

  factory ApiColorsModel.fromJson(Map<String, dynamic> json) =>
      _$ApiColorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiColorsModelToJson(this);

}
