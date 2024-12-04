import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/marketplace_model.dart';

class MarketplaceItemController {
  final String _apiUrl = 'http://10.22.162.199:8083/api/v1/sp/advertisement/public';

  // Fetch data from the API
  Future<List<MarketplaceItem>> fetchMarketplaceItems() async {
    try {
      final response = await http.get(Uri.parse(_apiUrl));
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => MarketplaceItem.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  // Format the price with a $ symbol
  String getFormattedPrice(String price) {
    return "\$$price";
  }

  // Format the created date to a readable format
  String getFormattedDate(DateTime? date) {
    if (date == null) return "Unknown Date";
    return "${date.day}/${date.month}/${date.year}";
  }
}
