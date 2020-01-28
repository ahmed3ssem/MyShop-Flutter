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
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(productData.imageUrl,fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Text('\$${productData.price}',style: TextStyle(color: Colors.grey,fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(productData.description,textAlign: TextAlign.center,softWrap: true,),
            ),
          ],
        ),
      )
    );
  }
}
