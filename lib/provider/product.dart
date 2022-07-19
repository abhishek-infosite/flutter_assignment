import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageURL;
  late bool isFavorite;

  Product({
    required this.description,
    required this.id,
    required this.imageURL,
    this.isFavorite = false,
    required this.price,
    required this.title
  });

  void toggleFavoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

