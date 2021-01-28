import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier{

  List<Product> _items = [
    Product(id: 'p1', 
    title: 'Zeytin', 
    description: 'Yemeklik', 
    price: 32.12, 
    imageurl: 'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg'),
    Product(id: 'p2', title: 'Zeytin', description: 'Yemeklik', price: 32.12, imageurl: 'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg'),
    Product(id: 'p3', title: 'Zeytin', description: 'Yemeklik', price: 32.12, imageurl: 'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg'),
    Product(id: 'p4', title: 'Zeytin', description: 'Yemeklik', price: 32.12, imageurl: 'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg'),
    Product(id: 'p5', title: 'Zeytin', description: 'Yemeklik', price: 32.12, imageurl: 'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg')

  ];

  //var _showFavoritesOnly = false;


  List<Product> get items{
    // if(_showFavoritesOnly){
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems{
    print(_items);
    return _items.where((element) => element.isFavorite).toList();
    
  }

  Product findById(String id){
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct(){
    //_items.add(value);
    notifyListeners();
  }

  // void showFavoritesOnly(){
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll(){
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }


  
}