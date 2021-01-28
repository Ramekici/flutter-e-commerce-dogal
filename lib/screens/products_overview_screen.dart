


import '../widgets/products_grid.dart';

import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar( 
        title: Text('Doğal Ürünler'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected:(FilterOptions selectedValue){
              if(selectedValue == FilterOptions.Favorites){
                  // productDataContainer.showFavoritesOnly();
                  _showFavorites = true;
              }else{
                  // productDataContainer.showAll();
                  _showFavorites = false;
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
            ])
        ],
        
        ),
      body: ProductGrid(_showFavorites)

    );
  }
}