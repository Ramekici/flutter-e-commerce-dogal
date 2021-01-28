import 'package:e_commerce_dogal_flutter/providers/products.dart';
import 'package:e_commerce_dogal_flutter/screens/products_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Doğal Ürünler',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange.shade500,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Lato'),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
