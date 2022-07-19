// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../provider/orders.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({ Key? key }) : super(key: key);

  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        title: const Text(
          'Your Cart',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(20.0),
            
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20.0
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      cart.totalAmount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    onPressed: (){
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(), 
                        cart.totalAmount
                      );
                      cart.clear();
                    }, 
                    child: const Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (ctx, i) => CartItem(
                id: cart.items.values.toList()[i].id, 
                productId: cart.items.keys.toList()[i],
                title: cart.items.values.toList()[i].title, 
                quantity: cart.items.values.toList()[i].quantity,
                price: cart.items.values.toList()[i].price
              ),
            ),
          )
        ],
      ),
    );
  }
}