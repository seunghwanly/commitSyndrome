import 'package:flutter/material.dart';
import 'package:gajuga_user/model/shoppingcart_model.dart';
import 'package:gajuga_user/util/firebase_method.dart';

class StateProvider with ChangeNotifier {
  // constructor
  StateProvider();

  //----------------------------------------------------------------------- SUB MENU
  // sub menu - selected option
  List<Map<String, dynamic>> optionList = [
    {
      'category' : 'size',
      'selected' : '',
      'addedCost' : 0
    },
    {
      'category' : 'crust',
      'selected' : '',
      'addedCost' : 0
    }
  ];
  
  getOptionList() => this.optionList;

  void addOptionListSize(String selected, int addedCost) {
    this.optionList[0]['selected'] = selected;
    this.optionList[0]['addedCost'] = addedCost;
    notifyListeners();
  }
  void addOptionListCrust(String selected, int addedCost) {
    this.optionList[1]['selected'] = selected;
    this.optionList[1]['addedCost'] = addedCost;
    notifyListeners();
  }

  //----------------------------------------------------------------------- SHOPPING CART
   
  getShoppingCart() => FirebaseMethod().getShoppingCart();

}