import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/pages/error_page.dart';
import 'package:shop/presentation/widgets/buttons/add_to_basket_button.dart';
import 'package:shop/presentation/widgets/color_circle.dart';

import '../cubits/basket_cubit/basket_cubit.dart';
import '../cubits/item_card_cubit/item_card_cubit.dart';

class ItemCardPage extends StatelessWidget {
  const ItemCardPage({super.key, required this.id});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ItemCardCubit(context.read<ItemCardRepository>(), id)),
        BlocProvider(
            create: (context) => BasketCubit(
                  context.read<BasketRepository>(),
                )),
      ],
      child: const ItemCardPageView(),
    );
  }
}

class ItemCardPageView extends StatefulWidget {
  const ItemCardPageView({super.key});

  @override
  State<ItemCardPageView> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCardPageView> {
  @override
  void initState() {
    context.read<ItemCardCubit>().fetchItemCard();
    context.read<BasketCubit>().fetchBasket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCardCubit, ItemCardState>(
      builder: (context, state) {
        if (state.status.isSuccess) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => Navigator.pop(context, false),
                ),
                title: FittedBox(
                    fit: BoxFit.fill, child: Text('${state.item?.title}')),
                backgroundColor: Colors.blue[200]),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                      height: 350,
                      width: 300,
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child:
                              Image.network('${state.item?.image?.file.url}'))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 300,
                        child: Text(
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                            '${state.item?.title}')),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                          elevation: 0,
                          child: Text(
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              'цена: ${state.item?.price}')),
                      Expanded(
                          child: Column(
                        children: [
                          state.item?.colors.length == 1
                              ? const Text(
                                  style: TextStyle(fontSize: 20), 'цвет:')
                              : const Text(
                                  style: TextStyle(fontSize: 20), 'цвета:'),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 20,
                              width: state.item!.colors.length * 40,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: ColorCircle(
                                      code: state.item?.colors[index].code,
                                    ),
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemCount: state.item?.colors.length,
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                AddToBasketButton(productId: state.item?.id),
              ],
            ),
          );
        }
        if (state.status.isFailure) {
          return ErrorPage(refresh: () => initState());
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
