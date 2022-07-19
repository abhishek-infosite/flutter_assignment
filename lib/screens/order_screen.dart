import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../provider/orders.dart' show Orders;
import '../widgets/orders_items.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        title: const Text(
          'Your Order',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: ordersData.orders.length,
        itemBuilder: (ctx, i) => 
          OrderItems(ordersData.orders[i]),
      ),
    );
  }
}