import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

enum filterOption{
Favourites,
All,
}

class ProductOverView extends StatefulWidget{
  @override
  ProductOverViewState createState() => ProductOverViewState();
}
class ProductOverViewState extends State<ProductOverView> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products =_showOnlyFavourites ? productData.favouritesProducts : productData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (filterOption selectedValue){
              setState(() {
                if(selectedValue == filterOption.Favourites)
                {
                  _showOnlyFavourites = true;
                }
                else
                {
                  _showOnlyFavourites = false;
                }

              });
              },
            icon: Icon(
                Icons.more_vert
            ),
            itemBuilder: (_)=>[
              PopupMenuItem(child: Text("Favourites"), value: filterOption.Favourites,),
              PopupMenuItem(child: Text("Show All"), value: filterOption.All,),
            ],
          )
        ],
      ),
      body: GridView.builder(
          padding:const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2 , crossAxisSpacing: 10,mainAxisSpacing: 10),
          itemBuilder: (context,i)=>ChangeNotifierProvider.value(
            value: products[i],
            child: ProductItem(),
          ),
          itemCount: products.length,
      ),
    );
  }
}
