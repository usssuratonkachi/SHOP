import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/pages/create_order_page.dart';
import 'package:shop/presentation/widgets/buttons/back_to_catalog_button.dart';
import 'package:shop/presentation/widgets/item_for_basket.dart';

import '../cubits/basket_cubit/basket_cubit.dart';
import 'error_page.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BasketCubit(context.read<BasketRepository>()),
        ),
      ],
      child: const BasketPageView(),
    );
  }
}

class BasketPageView extends StatefulWidget {
  const BasketPageView({super.key});

  @override
  State<BasketPageView> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPageView> {
  @override
  void initState() {
    context.read<BasketCubit>().fetchBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(builder: (context, state) {
      if (state.status.isSuccess) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Корзина'),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context, false),
            ),
            backgroundColor: Colors.blue[200],
          ),
          body: state.basket?.items.length == 0
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'корзина пуста',
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BackToCatalogButton()
                    ],
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemForBasket(
                      price: state.basket?.items[index].price,
                      quantity: state.basket?.items[index].quantity,
                      title: state.basket?.items[index].item?.title,
                      url: state.basket?.items[index].item?.image?.file.url,
                      productId: state.basket?.items[index].item?.id,
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 5,
                  ),
                  itemCount: state.basket?.items.length ?? 0,
                ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue[200],
            child: CupertinoButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateOrderPage()));
              },
              child: const Text('оформить заказ'),
            ),
          ),
        );
      }
      if (state.status.isFailure) {
        return ErrorPage(refresh: () => initState());
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
