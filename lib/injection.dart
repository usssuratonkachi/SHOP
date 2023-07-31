import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/data/access_key_storage/access_key_storage.dart';
import 'package:shop/data/mappers/mappers.dart';
import 'package:shop/data/mappers/order_mapper.dart';

Future<Widget> injection(Widget app) async {
  final accessKeyStorage =
      AccessKeyStorage(await SharedPreferences.getInstance());

  //mappers
  final fileMapper = FileMapper();
  final imageMapper = ImageMapper(fileMapper: fileMapper);
  final colorsMapper = ColorsMapper();
  final paginationMapper = PaginationMapper();
  final itemMapper =
      ItemMapper(colorsMapper: colorsMapper, imageMapper: imageMapper);
  final listItemsMapper = ListItemsMapper(
      itemMapper: itemMapper, paginationMapper: paginationMapper);
  final listItemsMapperWithoutPagination =
      ListItemsMapperWithoutPagination(itemMapper: itemMapper);
  final productCategoriesMapper = ProductCategoriesMapper();
  final listProductCategoriesMapper = ListProductCategoriesMapper(
      productCategoriesMapper: productCategoriesMapper);
  final userMapper = UserMapper();
  final basketItemMapper = BasketItemMapper(itemMapper: itemMapper);
  final basketMapper =
      BasketMapper(userMapper: userMapper, basketItemMapper: basketItemMapper);
  final statusMapper = StatusMapper();
  final orderRequestMapper = OrderRequestMapper();
  final orderErrorMapper =
      OrderErrorMapper(orderRequestMapper: orderRequestMapper);
  final orderResponseErrorMapper =
      OrderResponseErrorMapper(orderErrorMapper: orderErrorMapper);
  final orderResponseMapper = OrderResponseMapper(
    basketMapper: basketMapper,
    statusMapper: statusMapper,
  );

  //repositories
  final itemRepository = ItemRepository(listItemsMapper: listItemsMapper);
  final itemCardRepository = ItemCardRepository(itemMapper: itemMapper);
  final productCategoriesRepository = ProductCategoriesRepository(
      listProductCategoriesMapper: listProductCategoriesMapper);
  final sortItemsRepository =
      SortItemsRepository(listItemsMapper: listItemsMapperWithoutPagination);
  final authenticationRepository = AuthenticationRepository();
  final basketRepository = BasketRepository(
      basketMapper: basketMapper, accessKeyStorage: accessKeyStorage);
  final accessKeyRepository =
      AccessKeyRepository(accessKeyStorage: accessKeyStorage);
  final orderRepository = OrderRepository(
    orderResponseMapper: orderResponseMapper,
    orderResponseErrorMapper: orderResponseErrorMapper,
    accessKeyStorage: accessKeyStorage,
  );

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());

  return MultiRepositoryProvider(providers: [
    RepositoryProvider<ItemRepository>(create: (_) => itemRepository),
    RepositoryProvider<ItemCardRepository>(create: (_) => itemCardRepository),
    RepositoryProvider<ProductCategoriesRepository>(
        create: (_) => productCategoriesRepository),
    RepositoryProvider<SortItemsRepository>(create: (_) => sortItemsRepository),
    RepositoryProvider<AuthenticationRepository>(
        create: (_) => authenticationRepository),
    RepositoryProvider<BasketRepository>(create: (_) => basketRepository),
    RepositoryProvider<AccessKeyRepository>(create: (_) => accessKeyRepository),
    RepositoryProvider<OrderRepository>(
        create: (_) => orderRepository),
  ], child: app);
}
