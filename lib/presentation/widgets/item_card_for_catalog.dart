import 'package:flutter/material.dart';
import 'package:repository/repository.dart';

import 'color_circle.dart';

class ItemCardForCatalog extends StatelessWidget {
  const ItemCardForCatalog({
    Key? key,
    required this.id,
    required this.title,
    required this.url,
    required this.price,
    required this.colors,
  }) : super(key: key);

  final int? id;
  final String? title;
  final String? url;
  final double? price;
  final List<ColorsModel> colors;

  @override
  Widget build(BuildContext context) {

    itemPrice() {
      return Text(
        '$price ₽',
        style: const TextStyle(fontSize: 15),
      );
    }

    itemTitle() {
      return Text(
        '$title',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    itemColors() {
      return SizedBox(
        height: 20,
        width: colors.length * 40,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ColorCircle(
                code: colors[index].code,
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: const EdgeInsets.all(60),
        decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Image.network('$url'),
            ),
            const SizedBox(
              height: 20,
            ),
            itemTitle(),
            const SizedBox(
              height: 20,
            ),
            itemPrice(),
            const SizedBox(
              height: 10,
            ),
            itemColors(),
          ],
        ),
      ),
    );
  }
}
