import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/trip_days_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/trip_appbar2.dart';

class TripScreen2 extends StatefulWidget {
  const TripScreen2({super.key});

  @override
  TripScreen2State createState() => TripScreen2State();
}

class TripScreen2State extends State<TripScreen2> {
  final TripDaysController controller = Get.put(TripDaysController());
  final List<String> _addedItems = [];
  final List<String> _allItems = [
    'Ella Rock',
    '9 Arch Bridge',
    'Ravana Falls',
    'Ravana Cave',
    'Little Adams Peak'
  ];
  final List<String> _itemImages = [
    'assets/images/ella_rock.jpg',
    'assets/images/9_arch_bridge.jpg',
    'assets/images/ravana_falls.jpg',
    'assets/images/ravana_cave.jpg',
    'assets/images/little_adams_peak.jpg'
  ];

  void _addItem(String item, String image) {
    if (!_addedItems.contains(item)) {
      setState(() {
        _addedItems.add(item);
      });
    }
  }

  void _handleSave() {
    if (_addedItems.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select a destination',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: AppTheme.colors.white,
      );
    } else {
      Get.snackbar(
        'Success',
        'Trip saved successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: AppTheme.colors.white,
      );
      // Add logic to save the trip here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TripAppbar2(
        content: Obx(() {
          return ColoredBox(
            color: AppTheme.colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _tabButton(controller, 0, 'Day 1'),
                      _tabButton(controller, 1, 'Day 2'),
                      _tabButton(controller, 2, 'Day 3'),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: IndexedStack(
                    index: controller.selectedIndex.value,
                    children: [
                      _dayContent('Day 1 Plan'),
                      _dayContent('Day 2 Plan'),
                      _dayContent('Day 3 Plan'),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        isEditMode: false,
        onEditModeToggle: _handleSave, // Use the method here
      ),
    );
  }

  Widget _tabButton(TripDaysController controller, int index, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextButton(
          onPressed: () => controller.changeTab(index),
          style: TextButton.styleFrom(
            backgroundColor: controller.selectedIndex.value == index
                ? AppTheme.colors.primary
                : AppTheme.colors.primary_dark_3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: controller.selectedIndex.value == index
                    ? AppTheme.colors.white
                    : AppTheme.colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dayContent(String content) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: [
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.colors.primary_dark_3,
              ),
            ),
            ..._buildContentRows()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContentRows() {
    final List<Widget> rows = [];
    for (int i = 0; i < _allItems.length; i++) {
      final item = _allItems[i];
      final image = _itemImages[i];
      rows.add(
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 8, bottom: 8),
          child: Row(
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(color: AppTheme.colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(image, fit: BoxFit.fill),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.primary_dark_3,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _addItem(item, image),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: AppTheme.colors.secondary_dark_2,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    if (_addedItems.isNotEmpty) {
      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Destinations',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.colors.white,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._addedItems.map((item) {
                      final index = _allItems.indexOf(item);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(color: AppTheme.colors.white),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(_itemImages[index], fit: BoxFit.fill),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.colors.primary_dark_3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return rows;
  }
}
