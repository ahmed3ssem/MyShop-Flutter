import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

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
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if(_isInit)
      {
        Provider.of<ProductProvider>(context).getProducts();
      }
    _isInit = false;
    super.didChangeDependencies();
  }


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
          ),
          Consumer <Cart> (builder: (_,cartData,ch)=> Badge(
              child: ch,
              value: cartData.itemCount.toString()
          ),
          child: IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },),
          ),
        ],
      ),
      drawer: AppDrawer(),
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
