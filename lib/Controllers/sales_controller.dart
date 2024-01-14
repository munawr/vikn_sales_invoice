import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/sales_model.dart'; // Assuming your Data class is in this file

class SalesController extends GetxController {
  var isLoading = false.obs;
  var salesData = <Data>[].obs;
  var filteredSales = <Data>[].obs;
  Future<void> getSalesData() async {
    //print("'https://www.api.viknbooks.com/api/v10/sales/sale-list-page/'");
    //await Future.delayed(Duration(seconds: 2));
    isLoading(true);

    try {
      var accessToken = await getAccessToken();
      //print('Access Token: $accessToken');

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };

      var request = http.Request(
        'POST',
        Uri.parse('https://www.api.viknbooks.com/api/v10/sales/sale-list-page/'),
      );

      request.body = json.encode({
        "BranchID": 1,
        "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
        "CreatedUserID": 62,
        "PriceRounding": 3,
        "page_no": 1,
        "items_per_page": 10,
        "type": "Sales",
        "WarehouseID": 1,
      });
      request.headers.addAll(headers);

      var response = await request.send();

      //print('Response Status Code: ${response.statusCode}');
      var responseBody = await response.stream.bytesToString();
      //print('Response Body: $responseBody');

      if (response.statusCode == 200) {
        var decodedData = json.decode(responseBody);
        if (decodedData['data'] is List) {
          salesData.value = (decodedData['data'] as List)
              .map((dataJson) => Data.fromJson(dataJson))
              .toList();
          //print('Sales Data Length:--------- ${salesData.length}');
        } else {
          salesData.value = [];
        }
      } else {
        salesData.value = [];
      }
    } catch (e) {
      salesData.value = [];
      print('Error in getSalesData: $e');
    }

    isLoading(false);
  }

  void filterSales(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all sales data
      filteredSales.assignAll(salesData);
    } else {
      // Otherwise, filter based on the search query
      filteredSales.clear();
      filteredSales.addAll(salesData.where((sale) =>
      sale.voucherNo!.toLowerCase().contains(query.toLowerCase()) ||
          sale.customerName!.toLowerCase().contains(query.toLowerCase())));
    }
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }
  Future<void> clearAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
}
