import 'package:flutter/foundation.dart';


class CartItem{
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id, 
    @required this.title, 
    @required this.quantity, 
    @required this.price});
}


class Cart with ChangeNotifier{
  Map<String, CartItem> _items ={};

  Map<String, CartItem> get items{
    return {..._items};
  }

  int get cartQuantity{
    return _items.length;  
  }
  double get totalPrice{
    double totalP = 0.0;
    _items.forEach((key, value) {
      totalP += value.price * value.quantity;
    });
    return totalP;  
  }

  void addItem(String productId, double price, String title){
    if(_items.containsKey(productId)){

      _items.update(productId, (value) => CartItem(
        id:value.id, 
        title:value.title, 
        price:value.price, 
        quantity:value.quantity + 1));

    }else{
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(), 
        title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }

  void removeItems(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

  

}