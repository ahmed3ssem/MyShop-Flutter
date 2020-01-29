import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/user_product_item.dart';


class UserProductsScreen extends StatelessWidget {
  static const routeName = '/userProductsScreen';
  @override
  Widget build(BuildContext context) {
    final productData =  Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(itemCount: productData.items.length,itemBuilder:(_,index) =>Column(
            children: [
             UserProductItem(productData.items[index].title, productData.items[index].imageUrl),
              Divider(),
            ],
          )),
      ),
    );
  }
}
