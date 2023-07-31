import 'package:flutter/material.dart';

class ItemForOrderInfo extends StatelessWidget {
  const ItemForOrderInfo({
    super.key,
    required this.price,
    required this.title,
    required this.url,
    required this.quantity,
    required this.productId,
  });

  final int? productId;
  final double? price;
  final String? title;
  final String? url;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    itemPrice() {
      return Text(
        '${price! * quantity!} ₽',
        style: const TextStyle(fontSize: 15),
      );
    }

    itemTitle() {
      return Text(
        '$title',
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    }

    return Container(
      color: Colors.white,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Card(
              child: SizedBox(
                width: 90,
                height: 90,
                child: Image.network('$url'),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                itemTitle(),
                const Divider(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemPrice(),
                    Text('кол-во: $quantity'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
