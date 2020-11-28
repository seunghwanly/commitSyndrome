import 'package:flutter/material.dart';

// sales PROFIT | EXPENSE 공유

class Sales with ChangeNotifier {
  int profit = 0;
  int expense = 0;
  int netProfit = 0;

  Sales();

  void setProfit(int amount) {
    this.profit = amount;
    notifyListeners();
  }

  void setExpense(int amount) {
    this.expense = amount;
    notifyListeners();
  }

  void setNetProfit() {
    if (this.profit != null && this.expense != null)
      this.netProfit = this.profit - this.expense;
  }

  getNetProfit() => this.netProfit;
}
