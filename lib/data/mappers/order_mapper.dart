import 'package:api/api.dart';
import 'package:repository/repository.dart';
import 'package:shop/data/mappers/basket_mapper.dart';
import 'package:shop/data/mappers/mapper.dart';

class StatusMapper extends Mapper<ApiStatusModel, StatusModel> {
  @override
  StatusModel map(ApiStatusModel? model) {
    return StatusModel(
        id: model?.id ?? 0, title: model?.title ?? '', code: model?.code ?? '');
  }
}

class OrderRequestMapper
    extends Mapper<ApiOrderRequestModel, OrderRequestModel> {
  @override
  OrderRequestModel map(ApiOrderRequestModel? model) {
    return OrderRequestModel(
        name: model?.name ?? '',
        address: model?.address ?? '',
        phone: model?.phone ?? '',
        email: model?.email ?? '');
  }
}

class OrderErrorMapper extends Mapper<ApiOrderErrorModel, OrderErrorModel> {
  OrderErrorMapper({required this.orderRequestMapper});

  final OrderRequestMapper orderRequestMapper;

  @override
  OrderErrorModel map(ApiOrderErrorModel? model) {
    return OrderErrorModel(
        message: model?.message ?? '',
        code: model?.code ?? 0,
        request: orderRequestMapper.map(model?.request));
  }
}

class OrderResponseErrorMapper
    extends Mapper<ApiOrderResponseErrorModel, OrderResponseErrorModel> {
  OrderResponseErrorMapper({required this.orderErrorMapper});

  final OrderErrorMapper orderErrorMapper;

  @override
  OrderResponseErrorModel map(ApiOrderResponseErrorModel? model) {
    return OrderResponseErrorModel(error: orderErrorMapper.map(model?.error));
  }
}

class OrderResponseMapper
    extends Mapper<ApiOrderResponseModel, OrderResponseModel> {
  OrderResponseMapper({
    required this.basketMapper,
    required this.statusMapper,
  });

  final BasketMapper basketMapper;
  final StatusMapper statusMapper;

  @override
  OrderResponseModel map(ApiOrderResponseModel? model) {
    return OrderResponseModel(
      id: model?.id ?? 0,
      name: model?.name ?? '',
      address: model?.address ?? '',
      phone: model?.phone ?? '',
      email: model?.email,
      basket: basketMapper.map(model?.basket),
      totalPrice: model?.totalPrice ?? 0,
      comment: model?.comment ?? '',
      status: statusMapper.map(model?.status),
    );
  }
}
