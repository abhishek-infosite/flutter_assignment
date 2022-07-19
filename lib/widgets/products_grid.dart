import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';
import '../provider/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  // ignore: use_key_in_widget_constructors
  const ProductsGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final product = showFavoriteOnly ? productsData.favoriteItems :productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: product.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0
        ), 
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: product[i],
          child: const ProductItems(),
        ),
      );
  }
}
