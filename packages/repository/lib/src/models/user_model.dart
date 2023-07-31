import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.accessKey
  });

  final String id;
  final String? email;
  final Future<String>? accessKey;

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;


  @override
  List<Object?> get props => [id, email, accessKey];
}
