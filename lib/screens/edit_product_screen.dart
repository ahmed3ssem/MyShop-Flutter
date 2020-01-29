import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/EditProductScreen';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _desribeFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final  _imageFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id:null ,
    title: '',
    imageUrl: '',
    price: 0,
    description: ''
  );

  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl()
  {
    if(!_imageFocusNode.hasFocus)
      {
        setState(() {

        });
      }
  }

  void _saveForm()
  {
    _form.currentState.save();
    print(_editedProduct.price);
    print(_editedProduct.title);
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);
  }
  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImageUrl);
    _desribeFocusNode.dispose();
    _priceFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Edit Product"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration:const InputDecoration(labelText: 'Title'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                    onSaved: (value){_editedProduct = Product(title: value,price: _editedProduct.price,id: null,description: _editedProduct.description,imageUrl: _editedProduct.imageUrl);},
                  ),
                  TextFormField(
                    decoration:const InputDecoration(labelText: 'Price'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _priceFocusNode,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus(_desribeFocusNode);
                    },
                      onSaved: (value){_editedProduct = Product(title: _editedProduct.title,price:double.parse(value) ,id: null,description: _editedProduct.description,imageUrl: _editedProduct.imageUrl);}
                  ),
                  TextFormField(
                    decoration:const InputDecoration(labelText: 'Description'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    focusNode: _desribeFocusNode,
                      onSaved: (value){_editedProduct = Product(title: _editedProduct.title,price:_editedProduct.price ,id: null,description:value,imageUrl: _editedProduct.imageUrl);}
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(top: 8,right: 10),
                        decoration: BoxDecoration(border: Border.all(
                          width: 1,
                          color: Colors.grey
                        )),
                        child: _imageUrlController.text.isEmpty ? Text("Enter ImageUrl" ) : FittedBox(child: Image.network(_imageUrlController.text),fit: BoxFit.cover,),
                      ),
                      Expanded(
                          child: TextFormField(
                            decoration:const InputDecoration(labelText: "imageUrl"),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageFocusNode,
                            onFieldSubmitted: (_){
                              _saveForm();
                            },
                              onSaved: (value){_editedProduct = Product(title: _editedProduct.title,price:_editedProduct.price,id: null,description: _editedProduct.description,imageUrl: value);}
                          ),
                      ),
                    ],
                  )
                ],
              )
          ),
      )
    );
  }
}
