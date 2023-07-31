import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/pages/basket_page.dart';
import 'package:shop/presentation/pages/create_order_page.dart';
import 'package:shop/presentation/pages/sort_catalog_page.dart';
import 'package:shop/presentation/widgets/build_sort_item_menu_method.dart';
import 'package:shop/presentation/widgets/item_card_for_catalog.dart';

import '../cubits/authentication_cubit/authentication_cubit.dart';
import '../cubits/item_cubit/item_cubit.dart';
import 'item_card_page.dart';
import 'orders_list_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ItemCubit(context.read<ItemRepository>(),
              context.read<ProductCategoriesRepository>()),
        ),
        BlocProvider(
            create: (context) =>
                AuthenticationCubit(context.read<AccessKeyRepository>()))
      ],
      child: const CatalogView(),
    );
  }
}

class CatalogView extends StatefulWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  final PagingController<int, Item> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((offset) {
      context.read<ItemCubit>().fetchItem(offset: offset);
    });
    context.read<ItemCubit>().fetchProductCategories();
    context.read<AuthenticationCubit>().fetchAccessKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ItemCubit, ItemState>(listener: (context, state) async {
      if (state.status.isSuccess) {
        if (state.itemList?.pagination?.page ==
                state.itemList?.pagination?.pages ||
            state.itemList!.items.length < 10) {
          _pagingController.appendLastPage(state.itemList!.items);
        } else {
          _pagingController.appendPage(
              state.itemList!.items, state.itemList!.pagination!.page! + 1);
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Каталог'),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              AuthenticationRepository().logOut();
            },
          ),
          backgroundColor: Colors.blue[200],
          actions: [
            PopupMenuButton<ProductCategoriesModel>(
                onSelected: (model) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SortCatalogPage(
                              categoryId: model.id,
                              categoryName: model.title,
                            ))),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                icon: const Icon(Icons.menu),
                itemBuilder: (context) =>
                    [...?state.listProductCategories?.items.map(buildItem)]),
          ],
        ),
        body: CupertinoScrollbar(
          child: CustomScrollView(
            slivers: [
              state.status.isSuccess
                  ? SliverList(
                      delegate: SliverChildListDelegate([
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      )
                    ]))
                  : SliverToBoxAdapter(
                      child: Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 20),
                      child: const CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    )),
              productBuilder(),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BasketPage()))
                      },
                  icon: const Icon(Icons.shopping_basket)),
              IconButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateOrderPage()))
                      },
                  icon: const Icon(Icons.account_balance_wallet)),
              IconButton(
                  onPressed: () => {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrdersListPage()))}, icon: const Icon(Icons.local_shipping)),
            ],
          ),
        ),
      );
    });
  }

  PagedSliverList<int, Item> productBuilder() {
    return PagedSliverList.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Item>(
          noItemsFoundIndicatorBuilder: (_) => Container(),
          firstPageProgressIndicatorBuilder: (_) => Container(),
          newPageProgressIndicatorBuilder: (_) => Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 20),
                child: const CircularProgressIndicator(),
              ),
          itemBuilder: (context, items, index) => SizedBox(
                height: 380,
                child: GestureDetector(
                    onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ItemCardPage(
                            id: items.id,
                          );
                        })),
                    child: ItemCardForCatalog(
                      title: items.title,
                      id: items.id,
                      price: items.price,
                      url: items.image?.file.url,
                      colors: items.colors,
                    )),
              )),
      separatorBuilder: (context, index) => const SizedBox(height: 0),
    );
  }
}
