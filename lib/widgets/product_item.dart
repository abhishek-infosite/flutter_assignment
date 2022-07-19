import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../screens/products_detail_screen.dart';
import '../provider/product.dart';
import '../provider/cart.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(
            ProductDetailsScreen.routeName,
            arguments: product.id,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
      footer: Consumer<Product>(
        builder: (ctx, product, child) => ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                product.isFavorite ? 
                Icons.favorite : 
                Icons.favorite_border
              ),
              onPressed: (){
                product.toggleFavoriteStatus();
              },
              // ignore: deprecated_member_use
              color: Theme.of(context).accentColor,
            ),
            title: Text(product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              onPressed: (){
                cart.addItems(product.title, product.price, product.title);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Added item to cart!'),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(label: 'UNDO', onPressed: (){
                      cart.removeSingleItem(product.id);
                    }),
                  )
                );
              },
              icon: const Icon(Icons.shopping_cart),
              // ignore: deprecated_member_use
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
