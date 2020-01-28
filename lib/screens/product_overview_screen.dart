import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products = productData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      body: GridView.builder(
          padding:const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2 , crossAxisSpacing: 10,mainAxisSpacing: 10),
          itemBuilder: (context,i)=>ProductItem(
              products[i].id,
              products[i].title,
              products[i].imageUrl),
          itemCount: products.length,
      ),
    );
  }
}
