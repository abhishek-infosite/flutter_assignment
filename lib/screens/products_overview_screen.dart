import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../provider/cart.dart';
import './cart_screen.dart';


enum FilterOptions{
  // ignore: constant_identifier_names
  Favorites,
  // ignore: constant_identifier_names
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0.0,
        title: const Text(
            'HOME',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        actions: <Widget>[
          PopupMenuButton(
            color: Colors.white,
            onSelected: (FilterOptions selectedValue){
              setState(() {
                if(selectedValue == FilterOptions.Favorites){
                _showFavoriteOnly = true;
                }else{
                _showFavoriteOnly = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black54,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorite'), 
                value: FilterOptions.Favorites,
              ),
              const PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ] 
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(
                  child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black54,
                      ),
                      onPressed: (){
                        Navigator.of(context).pushNamed(
                          CartScreen.routeName,
                        );
                      },
                  ), 
                  value: cart.itemCount.toString(), 
                ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(_showFavoriteOnly),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "BookMark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Destination",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
        ],
      ),
    );
  }
}