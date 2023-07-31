import 'package:equatable/equatable.dart';
import 'package:shop/data/models/pagination_model/pagination_model.dart';

class ListItemsModel extends Equatable {
  const ListItemsModel({
    required this.items,
    required this.pagination,
  });

  final List<Item> items;
  final PaginationModel? pagination;

  @override
  List<Object> get props => [items];
}


class ListItemsModelWithoutPagination extends Equatable {
  const ListItemsModelWithoutPagination({
    required this.items,
  });

  final List<Item> items;

  @override
  List<Object> get props => [items];
}

class Item{
  const Item(
      {required this.id,
      required this.title,
      required this.slug,
      required this.image,
      required this.price,
      required this.colors});

  final int id;
  final String title;
  final String slug;
  final ImageModel? image;
  final double price;
  final List<ColorsModel> colors;

}

class ImageModel {
  const ImageModel({
    required this.file,
  });

  final FileModel file;
}

class FileModel extends Equatable {
  const FileModel({
    required this.url,
    required this.name,
    required this.originalName,
    required this.extension,
  });

  final String url;
  final String name;
  final String originalName;
  final String extension;

  @override
  List<Object> get props => [url, name, originalName, extension];
}

class ColorsModel extends Equatable {
  const ColorsModel({
    required this.id,
    required this.title,
    required this.code,
  });

  final int id;
  final String title;
  final String code;

  @override
  List<Object> get props => [id, title, code];
}
