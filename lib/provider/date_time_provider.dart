import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  int _selectedIndex = 7;
  List<DateTime> _dates = [];

  DateTimeProvider() {
    DateTime today = DateTime.now();
    _dates = List.generate(
      15,
      (index) => today.subtract(
        Duration(days: 7 - index),
      ),
    );
  }

  int get selectedIndex => _selectedIndex;

  void setIndex(int i) {
    _selectedIndex = i;
    notifyListeners();
  }

  List<DateTime> get dates => _dates;
}
