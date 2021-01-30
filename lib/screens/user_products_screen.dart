import '../screens/edit_product_screen.dart';
import '../widgets/app_drawer.dart';

import '../widgets/user_products_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class UserProductsScreen extends StatelessWidget {
  static String routeName = '/user-product';

  const UserProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Yönetici'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            })
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: productData.items.length,
                itemBuilder: (ctx, ind) => Column(
                  children: <Widget>[
                    UserProductItem(
                          id: productData.items[ind].id,
                          title: productData.items[ind].title,
                          imageUrl: productData.items[ind].imageurl,
                        ),
                      Divider()
                  ],
                ))));
  }
}
