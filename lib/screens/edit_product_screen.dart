import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Price'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    focusNode: _priceFocusNode,
                    onFieldSubmitted: (value){
                      FocusScope.of(context).requestFocus(_desribeFocusNode);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    focusNode: _desribeFocusNode,
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
                            decoration: InputDecoration(labelText: "imageUrl"),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageFocusNode,
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
