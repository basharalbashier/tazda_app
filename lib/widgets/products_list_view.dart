import 'package:flutter/material.dart';
import 'package:tezda_app/modules/product.dart';
import 'product_widget.dart';

ListView productListView(List<Product> products, Size size) => ListView.builder(
    itemCount: products.length,
    shrinkWrap: true,
    itemBuilder: (context, i) {
      return SizedBox(
        width: size.width,
        child: productWidget(products[i], size),
      );
    });