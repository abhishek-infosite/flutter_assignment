import 'package:flutter/foundation.dart';

import '../provider/cart.dart';

class OrderItems {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;


  OrderItems({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItems> _orders = [];

  List<OrderItems> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProduct, double total){
    _orders.insert(0, OrderItems(
      id: DateTime.now().toString(),
      products: cartProduct,
      dateTime: DateTime.now(),
      amount: total,
    )
    );
    notifyListeners();
  }
}