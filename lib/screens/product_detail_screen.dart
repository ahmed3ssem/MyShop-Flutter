import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/productDetail';
  @override
  Widget build(BuildContext context) {
   final id =  ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
