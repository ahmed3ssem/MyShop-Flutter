import 'package:flutter/material.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = '/productDetail';
  @override
  Widget build(BuildContext context) {
   final id =  ModalRoute.of(context).settings.arguments as String;
   final productData = Provider.of<ProductProvider>(context ,listen: false ).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(productData.title),
      ),
    );
  }
}
