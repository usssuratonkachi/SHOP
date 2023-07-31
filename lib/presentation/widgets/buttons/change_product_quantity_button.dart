import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/basket_cubit/basket_cubit.dart';

class ChangeProductQuantityButton extends StatelessWidget {
  const ChangeProductQuantityButton(
      {required this.productId, required this.quantity, Key? key})
      : super(key: key);

  final int? productId;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
          color: Colors.blue[200], borderRadius: BorderRadius.circular(80)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 30,
              height: 30,
              child: CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  borderRadius: BorderRadius.circular(80),
                  child: const Text(
                    '-',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    context.read<BasketCubit>().decreaseQuantity(
                        productId: productId, quantity: quantity);
                  })),
          Text('$quantity',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(
              width: 30,
              height: 30,
              child: CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  borderRadius: BorderRadius.circular(80),
                  child: const Text(
                    '+',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    context.read<BasketCubit>().increaseQuantity(
                        productId: productId, quantity: quantity);
                  }))
        ],
      ),
    );
  }
}
