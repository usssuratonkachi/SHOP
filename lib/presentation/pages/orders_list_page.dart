import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:shop/presentation/widgets/orders_list_item.dart';

import '../../constants.dart';

class OrdersListPage extends StatelessWidget {
  const OrdersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => OrderCubit(context.read<OrderRepository>()))
      ],
      child: const OrdersListPageView(),
    );
  }
}

class OrdersListPageView extends StatefulWidget {
  const OrdersListPageView({super.key});

  @override
  State<OrdersListPageView> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrdersListPageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue[200],
              elevation: 0,
              leading: IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => Navigator.pop(context, false)),
              title: const Text('Ваши заказы')),
          body: ordersIdList.length != 0
              ? ListView.separated(
                  itemCount: ordersIdList.length,
                  itemBuilder: (context, index) {
                    return OrdersListItem(orderId: ordersIdList[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                )
              : const Center(
                  child: Text('нет заказов'),
                ));
    });
  }
}
