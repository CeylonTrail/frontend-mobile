import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/marketplace_model.dart';
import '../theme/app_theme.dart';
import 'marketplace_item_details.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}
class _MarketplaceState extends State<Marketplace> {
  String? _selectedItem;
  final List<String> _items = ['Equipments', 'Accommodation', 'Food & Restaurants', 'Vehicle'];
  final List<MarketplaceItem> items = [
    MarketplaceItem(
      title: "Item 1",
      imageUrls: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200",
        "https://via.placeholder.com/250",
        "https://via.placeholder.com/300",
      ],
      price: "\$100",
      description: 'This is the item description',
      location: 'Colombo',
    ),
    MarketplaceItem(
      title: "Item 12",
      imageUrls: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200",
        "https://via.placeholder.com/250",
        "https://via.placeholder.com/300",
      ],
      price: "\$400",
      description: 'This is the item description',
      location: 'Colombo',
    ),
    MarketplaceItem(
      title: "Item 4",
      imageUrls: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200",
        "https://via.placeholder.com/250",
        "https://via.placeholder.com/300",
      ],
      price: "\$900",
      description: 'This is the item description',
      location: 'Colombo',
    ),
    MarketplaceItem(
      title: "Item 5",
      imageUrls: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200",
        "https://via.placeholder.com/250",
        "https://via.placeholder.com/300",
      ],
      price: "\$100",
      description: 'This is the item description',
      location: 'Colombo',
    ),
    MarketplaceItem(
      title: "Item 9",
      imageUrls: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200",
        "https://via.placeholder.com/250",
        "https://via.placeholder.com/300",
      ],
      price: "\$1000",
      description: 'This is the item description',
      location: 'Colombo',
    ),
    MarketplaceItem(
      title: "Item 11",
      imageUrls: [
        "https://via.placeholder.com/150",
        "https://via.placeholder.com/200",
        "https://via.placeholder.com/250",
        "https://via.placeholder.com/300",
      ],
      price: "\$1010",
      description: 'This is the item description',
      location: 'Colombo',
    ),
    // Add more items here...
  ];

  // Add a TextEditingController and a list for filtered items
  final TextEditingController _searchController = TextEditingController();
  List<MarketplaceItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = items; // Initially show all items
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = items.where((item) {
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
        width: double.infinity,
        color: AppTheme.colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/bxs-map.svg'),
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.primary_dark_3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedItem,
                        hint: Text(
                          'Select Category',
                          style: TextStyle(
                            color: AppTheme.colors.primary_dark_3,
                          ),
                        ),
                        items: _items.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppTheme.colors.primary.withOpacity(0.1),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colors.primary,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                        dropdownColor: Colors.white,
                        elevation: 0,
                        style: TextStyle(
                          color: AppTheme.colors.black,
                          fontSize: 18,
                        ),
                        icon: Icon(Icons.arrow_drop_down, color: AppTheme.colors.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: size.height * 0.68,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: _filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = _filteredItems[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MarketplaceItemDetailPage(item: item),
                                ),
                              );
                            },
                            child: Card(
                              color: AppTheme.colors.secondary_light_1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Hero(
                                      tag: '${item.title}-${item.imageUrls.first}',// change this later to an id or some unique value
                                      child: CachedNetworkImage(
                                        imageUrl: item.imageUrls.first,
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                    child: Text(
                                      item.price,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: AppTheme.colors.primary_light_1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}