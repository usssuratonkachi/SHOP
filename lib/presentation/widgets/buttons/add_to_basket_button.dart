import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/basket_cubit/basket_cubit.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({Key? key, required this.productId})
      : super(key: key);

  final int? productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 115,
          child: MaterialButton(
            shape: const StadiumBorder(),
            color: Colors.lightBlueAccent,
            splashColor: Colors.lightBlueAccent,
            highlightColor: Colors.lightBlueAccent,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            onPressed: () {
              context.read<BasketCubit>().postItemToBasket(
                    productId: productId,
                  );
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.blue[200],
                  duration: const Duration(seconds: 2),
                  content: const Text('товар добавлен в корзину')));
              Navigator.pop(context, false);
            },
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('в корзину')),
                  SizedBox(
                    width: 4,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(Icons.add_box_outlined))
                ]),
          ),
        ),
      );
    });
  }
}
