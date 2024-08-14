import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/marketplace_model.dart';
import '../theme/app_theme.dart';
import 'marketplace_item_details.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Marketplace> {
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
    ), MarketplaceItem(
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


    // Add more items here...
  ];

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 20,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppTheme.colors.white
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){

                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/bxs-map.svg'),
                                Text('Location',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.colors.primary_dark_3
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DropdownButtonHideUnderline( // Removes the default underline
                      child: DropdownButton<String>(
                        value: _selectedItem,
                        hint: Text('Select Category',
                        style: TextStyle(
                          color: AppTheme.colors.primary_dark_3
                        ),),
                        items: _items.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), // Round corners
                                color: AppTheme.colors.primary.withOpacity(0.1), // Custom background color for item
                              ),
                              padding: EdgeInsets.all(10), // Padding for item tiles
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppTheme.colors.primary, // Custom text color
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
                        dropdownColor: Colors.white, // Background color of dropdown
                        elevation: 0, // Removes the elevation
                        style: TextStyle(
                          color: AppTheme.colors.black, // Text style for selected item
                          fontSize: 18,
                        ),
                        icon: Icon(Icons.arrow_drop_down, color: AppTheme.colors.primary), // Custom icon color
                        borderRadius: BorderRadius.circular(10), // Rounded corners for dropdown
                      ),
                    ),
                  ),
                ],
              ),
              //marketplace grid
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: size.height * 0.68,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          childAspectRatio: 0.75, // Aspect ratio for the items
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
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
                                      tag: item.imageUrls.first, // Use the first image URL as the hero tag
                                      child: CachedNetworkImage(
                                        imageUrl: item.imageUrls.first, // Show only the first image
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      item.title,
                                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                                    child: Text(
                                      item.price,
                                      style: TextStyle(fontSize: 14.0, color: Colors.green),
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
