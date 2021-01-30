import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Zeytin',
        description: 'Kahvaltılık',
        price: 32.12,
        imageurl:
            'https://cdn.pixabay.com/photo/2015/10/02/15/59/olive-oil-968657_960_720.jpg'),
    Product(
        id: 'p2',
        title: 'Kars Kaşar',
        description: 'Kahvaltılık',
        price: 23.00,
        imageurl:
            'https://cdn.pixabay.com/photo/2010/12/13/10/24/cheese-2785__340.jpg'),
    Product(
        id: 'p3',
        title: 'Yumurta',
        description: 'Doğal ve Serbest Gezen Tavuk yumurtası',
        price: 12.50,
        imageurl:
            'https://cdn.pixabay.com/photo/2015/09/17/17/19/egg-944495_960_720.jpg'),
    Product(
        id: 'p4',
        title: 'Cherry Domates',
        description: 'Kahvaltılık mis cherry',
        price: 14.00,
        imageurl:
            'https://cdn.pixabay.com/photo/2019/05/29/19/04/tomatoes-4238247_960_720.jpg'),
    Product(
        id: 'p5',
        title: 'Pastırma',
        description: 'Kayseri Pastırması',
        price: 32.12,
        imageurl:
            'https://cdn.pixabay.com/photo/2017/09/30/18/22/meat-2802998_960_720.jpg')
  ];

  //var _showFavoritesOnly = false;

  List<Product> get items {
    // if(_showFavoritesOnly){
    //   return _items.where((element) => element.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(), 
      title: product.title,
      description: product.description, 
      price: product.price, 
      imageurl: product.imageurl);
      //_items.add(newProduct);
      _items.insert(0, newProduct);
    //_items.add(value);
    notifyListeners();
  }

  void updateProduct(String id, Product editedProduct) {
    final index = _items.indexWhere((element) => element.id == id);
    if(index >= 0){
      _items[index] = editedProduct;
    }else{
      print('....');
    }
    notifyListeners();
  }

  void deleteProduct(String id) {
     _items.removeWhere((element) => element.id == id);
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
