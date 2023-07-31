import 'package:equatable/equatable.dart';

class PaginationModel extends Equatable {
  const PaginationModel({this.page, this.pages, this.total});

  final int? page;
  final int? pages;
  final int? total;

  @override
  List<Object?> get props => [page, pages, total];
}
