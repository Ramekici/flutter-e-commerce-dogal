import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartContainer = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: <Widget>[
          Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Toplam', style: TextStyle(fontSize: 14)),
                      SizedBox(
                        width: 10,
                      ),
                      Chip(
                          padding: EdgeInsets.all(5),
                          label: Text(
                            '${cartContainer.totalPrice.toStringAsFixed(2)} ₺',
                            style: TextStyle(
                                color: Colors.white),
                          ),
                          backgroundColor: Theme.of(context).primaryColor)
                    ])),
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: FlatButton(
                onPressed: () {
                  Provider.of<Orders>(context, listen: false).addOrder(
                      cartContainer.items.values.toList(),
                      cartContainer.totalPrice);
                  cartContainer.clear();
                },
                child: Text('Sipariş Ver', style: TextStyle(color: Colors.white),)),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: cartContainer.items.length,
                  itemBuilder: (ctx, ind) => CartItem(
                      id: cartContainer.items.values.toList()[ind].id,
                      productId: cartContainer.items.keys.toList()[ind],
                      title: cartContainer.items.values.toList()[ind].title,
                      quantity:
                          cartContainer.items.values.toList()[ind].quantity,
                      price: cartContainer.items.values.toList()[ind].price))),
        ]));
  }
}
