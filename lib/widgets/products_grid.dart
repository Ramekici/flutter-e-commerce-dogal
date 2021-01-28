import '../providers/products.dart';
import 'package:provider/provider.dart';

import './product_item.dart';

import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  
  final bool showFav;

  const ProductGrid(this.showFav);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts = showFav ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2,
         crossAxisSpacing: 10, mainAxisSpacing: 10), 
        itemBuilder: (ctx, ind) => ChangeNotifierProvider.value(
          value: loadedProducts[ind],
          //create: (context) => loadedProducts[ind],
          child: ProductItem(),
          //   loadedProducts[ind].id, 
          // loadedProducts[ind].title, 
          // loadedProducts[ind].imageurl)));
        ));
  }

  
}