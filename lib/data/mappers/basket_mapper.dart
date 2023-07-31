import 'package:api/api.dart';
import 'package:repository/repository.dart';
import 'mappers.dart';


class BasketMapper extends Mapper<ApiBasketModel, BasketModel> {
  BasketMapper({required this.userMapper, required this.basketItemMapper});

  final UserMapper userMapper;
  final BasketItemMapper basketItemMapper;

  @override
  BasketModel map(ApiBasketModel? model) {
    return BasketModel(
        id: model?.id ?? 0,
        items:
            model?.items != null ? basketItemMapper.mapList(model?.items) : [],
        user: userMapper.map(model?.user));
  }
}

class UserMapper extends Mapper<ApiUserModel, UserModel> {
  @override
  UserModel? map(ApiUserModel? model) {
    return UserModel(id: model?.id ?? 0, accessKey: model?.accessKey ?? '');
  }
}

class BasketItemMapper extends Mapper<ApiBasketItemModel, BasketItemModel> {
  BasketItemMapper({required this.itemMapper});

  final ItemMapper itemMapper;

  @override
  BasketItemModel? map(ApiBasketItemModel? model) {
    return BasketItemModel(
        item: itemMapper.map(model?.product),
        price: model?.price,
        id: model?.id,
        quantity: model?.quantity);
  }
}
