import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/marketplace_model.dart';  // Correct import for MarketplaceItem
import '../theme/app_theme.dart';
import '../widgets/utils.dart';
import 'marketplace_item_details.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  List<MarketplaceItem> _items = [];
  List<MarketplaceItem> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();
  String? _selectedItem;
  final List<String> _categories = [
    ''
    'Equipments',
    'Accommodation',
    'Food & Restaurants',
    'Vehicle'
  ];

  @override
  void initState() {
    super.initState();
    _fetchData();
    _searchController.addListener(_filterItems);
  }

  // Retrieve the token from SharedPreferences
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // Fetch the marketplace data using the token
  Future<void> _fetchData() async {
    try {
      final String? token = await getToken();

      if (token == null) {
        print("Token missing");
        throw Exception('Token is missing');
      }

      final response = await http.get(
        Uri.parse('http://10.22.162.199:8083/api/v1/sp/advertisement/public'),
        headers: {
          'accept': '*/*',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        final items = data.map((item) => MarketplaceItem.fromJson(item)).toList();
        setState(() {
          _items = items;
          _filteredItems = _items;
        });
      } else {
        throw Exception('Failed to load marketplace items');
      }
    } catch (e) {
      print(e);
      // Handle error appropriately
    }
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _items.where((item) {
        return item.title.toLowerCase().contains(query) ||
            item.description.toLowerCase().contains(query) ||
            item.location.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppTheme.colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: _searchController,
                  cursorColor: AppTheme.colors.primary,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: AppTheme.colors.primary_dark_3),
                    hintText: 'Search Marketplace',
                    hintStyle: TextStyle(
                      color: AppTheme.colors.secondary_light_2,
                      fontSize: 16,
                    ),
                    filled: true,
                    fillColor: AppTheme.colors.secondary_light_1.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  style: TextStyle(
                    color: AppTheme.colors.primary_dark_3,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DropdownButton<String>(
                      value: _selectedItem,
                      hint: Text('Category'),
                      items: _categories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: _filteredItems.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final item = _filteredItems[index];
                  // Check if imageUrls is not empty and if it contains valid data
                  final imageUrl = item.images.isNotEmpty
                      ? replaceLocalhostWithIP(item.images[0]) // Access the first image URL
                      : 'assets/images/no_image.jpg'; // Fallback image if empty

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MarketplaceItemDetailPage(
                              item: item, // Correct MarketplaceItem being passed
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: AppTheme.colors.secondary_light_1,
                        child: Row(
                          children: [
                            // Make sure the image is sized properly and doesn't overflow
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10), // Optional: for rounded corners
                              child: CachedNetworkImage(
                                imageUrl: item.images.isNotEmpty
                                    ? replaceLocalhostWithIP(item.images[0]) // Get the first image if available
                                    : 'assets/images/no_image.jpg', // Fallback image if empty
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                              ),
                            ),

                            const SizedBox(width: 16),
                            Expanded( // Wrap the column with Expanded to prevent overflow
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item.description,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                      "Rs.${item.rate.toString()}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
