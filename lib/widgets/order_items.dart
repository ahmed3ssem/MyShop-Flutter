import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItems extends StatefulWidget{
  final OrderItem order;

  OrderItems(this.order);
  @override
  OrderItemsState createState() => OrderItemsState();

}

class OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: (){
                  setState(() {
                    _expanded = !_expanded;
                  });
                }
            ),
          ),
          if(_expanded) Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
            height: min(widget.order.products.length * 20.0 + 10, 100),
            child: ListView(
              children: widget.order.products.map((prod) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(prod.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                  Text('${prod.quantity}x \$${prod.price}',style: TextStyle(fontSize: 18,color: Colors.grey),),
                ],
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
