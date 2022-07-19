import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import '../provider/orders.dart' as ord;

class OrderItems extends StatefulWidget {
  final ord.OrderItems order;

  // ignore: use_key_in_widget_constructors
  const OrderItems(this.order);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.order.amount.toString()),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime)
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? 
                Icons.expand_less : 
                Icons.expand_more
              ),
              onPressed: (){
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if(_expanded) Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4
            ),
            height: min((widget.order.products.length) * 20.0 + 10, 180),
            child: ListView(
              children: widget.order.products.map((e) => 
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      e.quantity.toString() + 'X' + e.price.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      ),
                    )
                  ],
                )
              ).toList()
            ),
          )
        ],
      ),
    );
  }
}