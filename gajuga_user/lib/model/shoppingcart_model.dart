import 'package:flutter/cupertino.dart';
import 'order_history_model.dart';

class ShoppingCart {
  int cost;
  String name;
  String key;
  Option option;

  ShoppingCart(int cost, String name, Option option) {
    this.cost = cost;
    this.name = name;
    this.option = option;
  }

  Map toJson() => {
        'name': name,
        'cost': cost,
      };

  factory ShoppingCart.fromJson(Map<String, dynamic> parsedJson) {
    return ShoppingCart(parsedJson['cost'], parsedJson['name'], Option.fromJson(parsedJson['option']));
  }
}
