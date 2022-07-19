// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart.dart';
import '../provider/products.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  
  static const routeName = '/product-details-screen';

  const ProductDetailsScreen({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context, 
      listen: false
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        title: Text(
          loadedProduct.title,
          style: const TextStyle(color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            SizedBox(
              height: 300.0,
              width: 600.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  loadedProduct.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "\u{20B9}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0
                  )
                ),
                Text(
                  loadedProduct.price.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0
              ),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              )
            ),
            const SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: (){
              cart.addItems(loadedProduct.title, loadedProduct.price, loadedProduct.title);
              Navigator.of(context).pushNamed(
                  CartScreen.routeName
              );
            },
             child: const Text("Order Now"),
             color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}