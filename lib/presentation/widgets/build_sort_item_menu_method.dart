import 'package:flutter/material.dart';
import 'package:repository/repository.dart';

PopupMenuItem<ProductCategoriesModel> buildItem(ProductCategoriesModel model) {
  return PopupMenuItem(
    value: model,
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        GestureDetector(child: Text(model.title.toString())),
      ]));
}

