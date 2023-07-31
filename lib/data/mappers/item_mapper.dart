import 'package:api/api.dart';
import 'package:repository/repository.dart';
import 'mappers.dart';
import 'package:shop/data/models/pagination_model/pagination_model.dart';



class FileMapper extends Mapper<ApiFileModel, FileModel> {
  @override
  FileModel map(ApiFileModel? model) {
    return FileModel(
      url: model?.url ?? '',
      name: model?.name ?? '',
      originalName: model?.originalName ?? '',
      extension: model?.extension ?? '',
    );
  }
}

class ColorsMapper extends Mapper<ApiColorsModel, ColorsModel> {
  @override
  ColorsModel? map(ApiColorsModel? model) {
    return ColorsModel(
        id: model?.id ?? 0, title: model?.title ?? '', code: model?.code ?? '');
  }
}

class ImageMapper extends Mapper<ApiImageModel, ImageModel> {
  ImageMapper({required this.fileMapper});

  final FileMapper fileMapper;

  @override
  ImageModel? map(ApiImageModel? model) {
    return ImageModel(file: fileMapper.map(model?.file));
  }
}

class ItemMapper extends Mapper<ApiItem, Item> {
  ItemMapper({required this.colorsMapper, required this.imageMapper});

  final ImageMapper imageMapper;
  final ColorsMapper colorsMapper;

  @override
  Item? map(ApiItem? model) {
    return Item(
      id: model?.id ?? 0,
      colors: colorsMapper.mapList(model?.colors),
      image: imageMapper.map(model?.image),
      price: model?.price ?? 0,
      slug: model?.slug ?? '',
      title: model?.title ?? '',
    );
  }
}


class PaginationMapper extends Mapper<ApiPaginationModel, PaginationModel> {
  @override
  PaginationModel? map(ApiPaginationModel? model) {
    return PaginationModel(
        page: model?.page ?? 1,
        pages: model?.pages ?? 1,
        total: model?.total ?? 1);
  }
}


class ListItemsMapper extends Mapper<ApiListItemsModel, ListItemsModel> {
  ListItemsMapper({required this.itemMapper, required this.paginationMapper});

  final ItemMapper itemMapper;
  final PaginationMapper paginationMapper;

  @override
  ListItemsModel? map(ApiListItemsModel? model) {
    final List<ApiItem>? items = model?.items;
    return ListItemsModel(
        items: items != null ? itemMapper.mapList(model?.items) : [], pagination: paginationMapper.map(model?.pagination));
  }
}


class ListItemsMapperWithoutPagination extends Mapper<ApiListItemsModelWithoutPagination, ListItemsModelWithoutPagination> {
  ListItemsMapperWithoutPagination({required this.itemMapper});

  final ItemMapper itemMapper;

  @override
  ListItemsModelWithoutPagination? map(ApiListItemsModelWithoutPagination? model) {
    final List<ApiItem>? items = model?.items;
    return ListItemsModelWithoutPagination(
        items: items != null ? itemMapper.mapList(model?.items) : []);
  }
}