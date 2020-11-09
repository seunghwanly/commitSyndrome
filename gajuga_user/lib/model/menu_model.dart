import 'package:flutter/cupertino.dart';
import 'dart:convert';

class Ingredient {
  String name;
  int quantity;

  Ingredient(@required String name, @required int quantity) {
    this.name = name;
    this.quantity = quantity;
  }
  Map toJson() => {
        'name': name,
        'quantity': quantity,
      };
}

class Menu {
  String name;
  int cost;
  List<Ingredient> ingredients;
  void updateMenu(String name, int cost) {
    print('updateMenu');
  }

  void addMenu(String name, int cost, List<Ingredient> ingredients) {
    print('addMenu');
  }

  void deleteMenu(String name) {
    print('deleteMenu');
  }

  Menu(@required String name, @required int cost,
      @required List<Ingredient> ingredients) {
    this.name = name;
    this.cost = cost;
    this.ingredients = ingredients;
  }
  String toJson() {
    String jsoncode = "";
    jsoncode += jsonEncode(name);
    jsoncode += jsonEncode(cost);
    jsoncode += jsonEncode(ingredients);
  }
}
