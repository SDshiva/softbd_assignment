import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime get selectedDate => _dates[_selectedIndex];

  String get formattedCurrentDate {
    DateTime today = DateTime.now();
    DateTime selectedDate = _dates[_selectedIndex];

    String dateFormatted = DateFormat('d MMMM', 'bn_BD').format(selectedDate);

    if (DateFormat('yyyyMMdd').format(today) ==
        DateFormat('yyyyMMdd').format(selectedDate)) {
      return 'আজ, $dateFormatted';
    } else {
      return dateFormatted;
    }
  }

  String get currentDayActivities {
    DateTime today = DateTime.now();
    DateTime selectedDate = _dates[_selectedIndex];

    if (selectedDate.weekday == today.weekday &&
        selectedDate.day == today.day) {
      return "আজকের কার্যক্রম";
    } else if (selectedDate.isBefore(today)) {
      return "গত ${DateFormat.E('bn_BD').format(_dates[_selectedIndex])}বারের কার্যক্রম";
    } else {
      return "আগামী ${DateFormat.E('bn_BD').format(_dates[_selectedIndex])}বারের কার্যক্রম";
    }
  }
}
