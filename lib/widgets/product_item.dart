import 'package:e_commerce_dogal_flutter/providers/cart.dart';
import 'package:e_commerce_dogal_flutter/providers/product.dart';
import 'package:e_commerce_dogal_flutter/screens/products_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageurl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(builder: (ctx, prod, child) => 
          IconButton(
                icon: Icon(prod.isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Theme.of(context).accentColor,
                onPressed: () => prod.toggleFavorite()),
          ),
          trailing: IconButton(
              icon: Icon(Icons.shopping_basket),
              color: Theme.of(context).accentColor,
              onPressed: (){
                cart.addItem(product.id, product.price, product.title);
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Ürün Sepete Eklendi.', textAlign:TextAlign.center),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(label:'İptal', onPressed:(){
                      cart.removeSingleItem(product.id);
                    }),
                  ));
                }),
        ),
      ),
    );
  }
}
