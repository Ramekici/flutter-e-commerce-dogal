import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: Text('Doğal Ürünler'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Satın Al'),
          onTap:(){
            Navigator.of(context).pushReplacementNamed('/');
          }
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Siparişlerim'),
          onTap:(){
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          }
        ),
        
      ],)
    );
  }
}