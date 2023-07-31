import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/pages/basket_page.dart';
import 'package:shop/presentation/pages/error_page.dart';
import 'package:shop/presentation/pages/item_card_page.dart';
import 'package:shop/presentation/widgets/item_card_for_catalog.dart';

import '../cubits/sort_items_cubit/sort_items_cubit.dart';
import 'create_order_page.dart';

class SortCatalogPage extends StatelessWidget {
  const SortCatalogPage(
      {super.key, required this.categoryId, required this.categoryName});

  final int? categoryId;
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SortItemsCubit(
          context.read<SortItemsRepository>(), categoryId, categoryName),
      child: const SortCatalogPageView(),
    );
  }
}

class SortCatalogPageView extends StatefulWidget {
  const SortCatalogPageView({Key? key}) : super(key: key);

  @override
  State<SortCatalogPageView> createState() => _SortCatalogPageViewState();
}

class _SortCatalogPageViewState extends State<SortCatalogPageView> {
  @override
  void initState() {
    context
        .read<SortItemsCubit>()
        .fetchSortItems(categoryId: context.read<SortItemsCubit>().categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortItemsCubit, SortItemsState>(
        builder: (context, state) {
      if (state.status.isSuccess) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${state.categoryName}'),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context, false),
            ),
            backgroundColor: Colors.blue[200],
          ),
          body: ListView.builder(
            itemCount: state.itemList?.items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ItemCardPage(id: state.itemList?.items[index].id))),
                child: SizedBox(
                  height: 380,
                  child: ItemCardForCatalog(
                    id: state.itemList?.items[index].id,
                    title: state.itemList?.items[index].title,
                    url: state.itemList?.items[index].image?.file.url,
                    price: state.itemList?.items[index].price,
                    colors: state.itemList!.items[index].colors,
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.blue[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BasketPage())),
                    icon: const Icon(Icons.shopping_basket)),
                IconButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateOrderPage()))
                        },
                    icon: const Icon(Icons.account_balance_wallet)),
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.local_shipping)),
              ],
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
