import 'dart:convert';
import 'dart:io';

import 'package:soft_bd_assignment/models/data_items_class.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<DataItem>> fetchData() async {
    try {
      final response =
          await get(Uri.parse("https://api.npoint.io/bc69ae1f6991da81ab9a"));
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        List<dynamic> jsonData = jsonDecode(response.body)['data'];
        return jsonData.map((json) => DataItem.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load Data');
      }
    } on SocketException catch (e) {
      print('Failed to load data: SocketException with message: ${e.message}');
      throw Exception(
          'Failed to load data: SocketException with message: ${e.message}');
    } on HttpException catch (e) {
      print('Failed to load data: HttpException with message: ${e.message}');
      throw Exception(
          'Failed to load data: HttpException with message: ${e.message}');
    } on FormatException catch (e) {
      print('Failed to load data: FormatException with message: ${e.message}');
      throw Exception(
          'Failed to load data: FormatException with message: ${e.message}');
    } catch (e) {
      print('Failed to load data: $e');
      throw Exception('Failed to load data: $e');
    }
  }
}
