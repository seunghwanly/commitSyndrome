import 'package:flutter/material.dart';

class OptionList with ChangeNotifier {

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
  
  OptionList();

  // OptionList(String selectedSize, int sizeCost, String selectedCrust, int sizeCrust) {};


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

}