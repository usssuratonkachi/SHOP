import 'package:flutter/material.dart';
import 'package:shop/presentation/pages/order_info_page.dart';

class OrdersListItem extends StatefulWidget {
  const OrdersListItem({super.key, required this.orderId});

  final int? orderId;

  @override
  State<OrdersListItem> createState() => _OrdersListItemState();
}

class _OrdersListItemState extends State<OrdersListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderInfoPage(orderId: widget.orderId))),
      child: SizedBox(
        height: 100,
        child: Card(
            child: Center(
          child: Text('заказ номер: ${widget.orderId}',
              style: const TextStyle(fontSize: 22)),
        )),
      ),
    );
  }
}
