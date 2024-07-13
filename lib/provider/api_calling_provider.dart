import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soft_bd_assignment/apis/api_service.dart';
import 'package:soft_bd_assignment/models/data_items_class.dart';

class DataProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<DataItem> _dataItems = [];
  bool _isLoading = false;
  String _errorMessage = "";
  String _timeOfDayText = "";

  List<DataItem> get dataItems => _dataItems;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get timeOfDayText => _timeOfDayText;

  Future<void> fetchData() async {
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();

    try {
      _dataItems = await _apiService.fetchData();
      print(_dataItems);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void timeFormatting(DataItem dataItem) {
    final date = DateTime.fromMillisecondsSinceEpoch(dataItem.date * 1000);
    final time = DateFormat('h:mm a', 'bn_BD').format(date);

    // Initialize an empty string to hold the time of day text

    // Determine time of day based on AM/PM
    print(time);
    if (time.contains("AM")) {
      // AM
      if (date.hour >= 4 && date.hour < 6) {
        _timeOfDayText = "ভোর";
        // return "ভোর";
        // notifyListeners();
      } else if (date.hour >= 6 && date.hour < 12) {
        _timeOfDayText = "সকাল";
        // notifyListeners();
        // return "সকাল";
      }
    } else if (time.contains("PM")) {
      // PM
      if (date.hour >= 12 && date.hour < 15) {
        _timeOfDayText = "দুপুর";
        // notifyListeners();
        // return "দুপুর";
      } else if (date.hour >= 15 && date.hour < 18) {
        _timeOfDayText = "বিকেল";
        // notifyListeners();
        // return "বিকেল";
      } else if (date.hour >= 18 && date.hour < 20) {
        _timeOfDayText = "সন্ধ্যা";
        // notifyListeners();
        // return "সন্ধ্যা";
      } else if (date.hour >= 20 && date.hour < 24) {
        _timeOfDayText = "রাত";
        // notifyListeners();
        // return "রাত";
      }
    }
    // _timeOfDayText = "";
    // return "";

    // notifyListeners();
  }
}
