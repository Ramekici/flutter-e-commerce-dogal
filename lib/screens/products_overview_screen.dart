import 'package:e_commerce_dogal_flutter/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';


enum FilterOptions{
  Favorites,
  All  
}

class ProductOverViewScreen extends StatefulWidget {

  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  
  var _showFavorites = false;
  
  @override
  Widget build(BuildContext context) {

    // final productDataContainer =  Provider.of<Products>(context, listen: false);
    //final cartContainer =  Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar( 
        title: Text('Doğal Ürünler'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected:(FilterOptions selectedValue){
              if(selectedValue == FilterOptions.Favorites){
                  // productDataContainer.showFavoritesOnly();
                  setState(() {
                    _showFavorites= true;
                  });
              }else{
                  // productDataContainer.showAll();
                  setState(() {
                    _showFavorites= false;
                  });
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder:(_) =>[
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
                ),
            ]),
            Consumer<Cart>(
              builder: (_, cartData, ch) => 
                Badge(
                  value: cartData.cartQuantity.toString(), 
                  child: ch ,
                ),
                child: IconButton(icon: Icon(Icons.shopping_cart), 
                onPressed:(){
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                })),  
        ],
        
        ),
      body: ProductGrid(_showFavorites)

    );
  }
}