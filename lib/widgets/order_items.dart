import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import 'package:intl/intl.dart';

class OrderItems extends StatelessWidget {
  final OrderItem order;

  OrderItems(this.order);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime)),
            trailing: IconButton(
                icon: Icon(Icons.expand_more),
                onPressed: (){}
            ),
          )
        ],
      ),
    );
  }
}
