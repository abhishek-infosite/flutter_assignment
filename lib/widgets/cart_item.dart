// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';

class CartItem extends StatelessWidget {

  final String id;
  final String productId;
  final String title;
  final double price;
  final int quantity;

  // ignore: use_key_in_widget_constructors
  const CartItem({
    required this.id,
    required this.productId,
    required this.price,
    required this.title,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context, 
          builder: (ctx) => AlertDialog(
            title: const Text('Are You Sure?'),
            content: const Text('Do you want to remove item from the cart?'),
            actions: [
              FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop(false);
                }, 
                child: const Text('NO'),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop(true);
                }, 
                child: const Text('YES'),
              ),
            ],
          )
        );
      },
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child:const Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        padding: const EdgeInsets.only(right: 20),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(
                    price.toString()
                  )
                ),
              )
            ),
            title: Text(title),
            subtitle: Text('Total '+(price*quantity).toString()),
            trailing: Text(quantity.toString()),
          ),
        ),
        
      ),
    );
  }
}