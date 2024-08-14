import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/app_theme.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Marketplace> {
  String? _selectedItem;
  final List<String> _items = ['Equipments', 'Accommodation', 'Food & Restaurants', 'Vehicle'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppTheme.colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                'Marketplace',
                style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.colors.primary_dark_3,
                    fontWeight: FontWeight.bold),
              ),
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
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }
}
