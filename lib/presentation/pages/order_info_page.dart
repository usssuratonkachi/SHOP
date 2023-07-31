import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:shop/presentation/widgets/order_info_text_information.dart';

import '../widgets/item_for_order_info.dart';
import 'error_page.dart';

class OrderInfoPage extends StatelessWidget {
  const OrderInfoPage({super.key, required this.orderId});

  final int? orderId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => OrderCubit(context.read<OrderRepository>()))
    ], child: OrderInfoPageView(orderId: orderId));
  }
}

class OrderInfoPageView extends StatefulWidget {
  const OrderInfoPageView({super.key, required this.orderId});

  final int? orderId;

  @override
  State<OrderInfoPageView> createState() => _OrderInfoPageViewState();
}

class _OrderInfoPageViewState extends State<OrderInfoPageView> {
  @override
  void initState() {
    context.read<OrderCubit>().fetchOrderInfo(orderId: widget.orderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      if (state.status.isSuccess) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Информация о заказе'),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            backgroundColor: Colors.blue[200],
          ),
          body: Column(children: [
            OrderInfoTextInformation(
                orderId: state.order?.id,
                name: state.order?.name,
                address: state.order?.address,
                phone: state.order?.phone,
                email: state.order?.email,
                totalPrice: state.order?.totalPrice,
                status: state.order?.status?.title),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ItemForOrderInfo(
                    price: state.order?.basket?.items[index].price,
                    quantity: state.order?.basket?.items[index].quantity,
                    title: state.order?.basket?.items[index].item?.title,
                    url:
                        state.order?.basket?.items[index].item?.image?.file.url,
                    productId: state.order?.basket?.items[index].item?.id,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: state.order?.basket?.items.length ?? 1,
              ),
            ),
          ]),
        );
      }
      if (state.status.isFailure) {
        return ErrorPage(refresh: () => initState(),);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
