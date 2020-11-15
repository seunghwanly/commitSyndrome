import 'package:flutter/cupertino.dart';
import 'order_history_model.dart';

class ShoppingCart {
  int cost;
  int count;
  String name;
  String key;
  Option option;
  String engName;

  ShoppingCart(
      int cost, int count, String name, Option option, String engName) {
    this.cost = cost;
    this.count = count;
    this.name = name;
    this.option = option;
    this.engName = engName;
  }

  Map toJson() => {
        'name': name,
        'cost': cost,
      };

  factory ShoppingCart.fromJson(Map<String, dynamic> parsedJson) {
    return ShoppingCart(
        parsedJson['cost'],
        parsedJson['cost'],
        parsedJson['name'],
        Option.fromJson(parsedJson['option']),
        parsedJson['eng_name']);
  }
}
