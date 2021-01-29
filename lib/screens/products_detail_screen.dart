import '../providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  //final String title;
  static String routeName = '/product-detail';

  //ProductDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context).settings.arguments as String; // id
    final productsData = Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(productsData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Image.network(productsData.imageurl, fit: BoxFit.cover),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              width: double.infinity,
              child: Text(productsData.description, 
              textAlign: TextAlign.center, softWrap: true,))

          ],
        ),
      ),
    );
  }
}
