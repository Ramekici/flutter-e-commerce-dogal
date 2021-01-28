import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartScreen extends StatelessWidget {

  static String routeName = '/cart';

  @override
  Widget build(BuildContext context) {

    final cartContainer =  Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Toplam', style: TextStyle(fontSize: 10)),
                  SizedBox(width: 10,),
                  Chip(label: Text('${cartContainer.totalPrice}', 
                  style: TextStyle(color: Theme.of(context).textTheme.headline3.color),), 
                  backgroundColor: Theme.of(context).primaryColor)

                ]
              )),
          ),
          FlatButton(
            onPressed: (){}, 
            child: Text('Sipariş Ver'))

        ]
      )
    );
  }
}