
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {

  //final String title;
  static String routeName = '/product-detail';

  //ProductDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {
   
    final productId = ModalRoute.of(context).settings.arguments as String; // id 
    final productsData =  Provider.of(context, listen: false).findById(productId);


    return Scaffold(
      appBar: AppBar(
        title: Text(productsData.title),
      ),
      body: Text(''),
    );
  }
}