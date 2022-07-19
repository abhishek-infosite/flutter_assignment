import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  final List<Product> _item = [
    Product(
      id: 'p1',
      title: 'For Rent',
      description: 'It is pretty big home!',
      price: 10000.00,
      imageURL: 'https://images.unsplash.com/photo-1518780664697-55e3ad937233?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGhvbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60',
    ),
    Product(
      id: 'p2',
      title: 'Open Houses',
      description: 'It is pretty big home!',
      price: 100000.00,
      imageURL: 'https://images.unsplash.com/photo-1480074568708-e7b720bb3f09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aG9tZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ),
    Product(
      id: 'p3',
      title: 'Recently Sold',
      description: 'It is pretty big home!',
      price: 20000000.00,
      imageURL: 'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8aG9tZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1000&q=60',
    ),
    Product(
      id: 'p4',
      title: 'New Houses',
      description: 'It is pretty big home!',
      price: 10000000.00,
      imageURL: 'https://images.unsplash.com/photo-1449844908441-8829872d2607?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGhvbWV8ZW58MHx8MHx8&auto=format&fit=crop&w=1000&q=60',
    )
  ];

  List<Product> get favoriteItems {
    return _item.where((element) => element.isFavorite).toList();
  }

  //var _showFavoriteOnly = false;

  List<Product> get items {
    // if(_showFavoriteOnly){
    //   return _item.where((element) => element.isFavorite).toList();
    // }
    return [..._item];
  }

  // void showFavoriteOnly(){
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAll(){
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  Product findById(String id){
    return _item.firstWhere((element) => element.id == id);
  }

  void addProvider(){
    //_item.add();
    notifyListeners();
  }
}
