
import 'package:flutter/material.dart';

class QtyNotifierHandler extends ChangeNotifier {
  int _qty = 0;
  int get qty => _qty;

  void setQty(int value) {
    _qty = value;
    notifyListeners();
  }
}
