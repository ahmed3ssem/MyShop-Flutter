import 'package:flutter/material.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) =>ProductProvider(),
      child: MaterialApp(
        title: "MyShop",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'
        ),
        home: ProductOverView(),
        routes: {
          ProductDetail.routeName : (context) => ProductDetail(),
        },
      ),
    );
  }
}
