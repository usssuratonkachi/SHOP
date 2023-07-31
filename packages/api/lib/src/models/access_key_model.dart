import 'package:json_annotation/json_annotation.dart';

part 'access_key_model.g.dart';

@JsonSerializable()
class ApiAccessKey {
  const ApiAccessKey({required this.accessKey});

  @JsonKey(name: "accessKey")
  final String accessKey;

  factory ApiAccessKey.fromJson(Map<String, dynamic> json) =>
      _$ApiAccessKeyFromJson(json);
}
