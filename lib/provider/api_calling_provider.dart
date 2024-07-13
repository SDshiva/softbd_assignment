import 'package:flutter/material.dart';
import 'package:soft_bd_assignment/apis/api_service.dart';
import 'package:soft_bd_assignment/models/data_items_class.dart';

class DataProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<DataItem> _dataItems = [];
  bool _isLoading = false;
  String _errorMessage = "";

  List<DataItem> get dataItems => _dataItems;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

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
}
