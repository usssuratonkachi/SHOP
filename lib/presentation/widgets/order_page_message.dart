import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:shop/presentation/pages/order_info_page.dart';

class OrderPageMessage extends StatefulWidget {
  const OrderPageMessage({Key? key}) : super(key: key);

  @override
  State<OrderPageMessage> createState() => _OrderErrorMessageState();
}

class _OrderErrorMessageState extends State<OrderPageMessage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      if (state.status.isSuccess) {
        return SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                  style: TextStyle(fontSize: 20), 'Заказ успешно создан!'),
              Text(
                  style: const TextStyle(fontSize: 20),
                  'номер заказа: ${state.order?.id}'),
              CupertinoButton(
                  child: const Text('на страницу заказа'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderInfoPage(orderId: state.order?.id)));
                  })
            ],
          ),
        );
      } else if (state.status.isFailure) {
        return SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              state.errorOrder?.error?.message != ''
                  ? Text(
                      textAlign: TextAlign.center,
                      '${state.errorOrder?.error?.message}')
                  : Container(),
              state.errorOrder?.error?.request?.name != ''
                  ? Text('name: ${state.errorOrder?.error?.request?.name}')
                  : Container(),
              state.errorOrder?.error?.request?.address != ''
                  ? Text(
                      'address: ${state.errorOrder?.error?.request?.address}')
                  : Container(),
              state.errorOrder?.error?.request?.phone != ''
                  ? Text(
                      textAlign: TextAlign.center,
                      'phone: ${state.errorOrder?.error?.request?.phone}')
                  : Container(),
              state.errorOrder?.error?.request?.email != ''
                  ? Text(
                      textAlign: TextAlign.center,
                      'email: ${state.errorOrder?.error?.request?.email}')
                  : Container(),
            ],
          ),
        );
      } else if (state.status.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return Container();
    });
  }
}
