import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable()
class ApiPaginationModel {
  ApiPaginationModel({this.page, this.pages, this.total});

  final int? page;
  final int? pages;
  final int? total;

  factory ApiPaginationModel.fromJson(Object? json) => _$ApiPaginationModelFromJson(json as Map<String, dynamic>);

  Map<String, dynamic> toJson() => _$ApiPaginationModelToJson(this);
}
