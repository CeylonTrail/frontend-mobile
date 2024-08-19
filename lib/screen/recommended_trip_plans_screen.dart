import 'package:cached_network_image/cached_network_image.dart';
import 'package:ceylontrailapp/screen/trip_plan_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../models/recommended_trip_plan_model.dart';
import '../theme/app_theme.dart';
import '../widgets/trip_plan_card.dart';

class RecommendedTripPlansScreen extends StatefulWidget {
  const RecommendedTripPlansScreen({super.key});

  @override
  State<RecommendedTripPlansScreen> createState() =>
      _RecommendedTripPlansScreenState();
}

class _RecommendedTripPlansScreenState
    extends State<RecommendedTripPlansScreen> {
  String? _selectedPlan = 'All';
  final List<String> _plans = [
    'All',
    '1 Day',
    '2 Days',
    '3 Days',
    '4 Days',
    '5 Days',
    '5+ Days'
  ];

  final List<RecommendedTripPlan> plans = [
    RecommendedTripPlan(
        title: "Ella",
        imageUrls: [
          "https://via.placeholder.com/150",
          "https://via.placeholder.com/200",
          "https://via.placeholder.com/250",
          "https://via.placeholder.com/300",
        ],
        days: '2',
        description: 'A 2 days trip to Ella',
        location: 'Badulla'),
    RecommendedTripPlan(
        title: "Kandy",
        imageUrls: [
          "https://via.placeholder.com/150",
          "https://via.placeholder.com/200",
          "https://via.placeholder.com/250",
          "https://via.placeholder.com/300",
        ],
        days: '3',
        description: 'A 2 days trip to Kandy',
        location: 'Kandy'),
    // Add more items here
  ];

  bool isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<RecommendedTripPlan> _filteredPlans = [];

  @override
  void initState() {
    super.initState();
    _filteredPlans = plans; // Initially show all items
    _searchController.addListener(_filterPlans);
  }

  void _filterPlans() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPlans = plans.where((item) {
        final matchesQuery = item.title.toLowerCase().contains(query) ||
            item.description.toLowerCase().contains(query) ||
            item.location.toLowerCase().contains(query);

        bool matchesDays;
        if (_selectedPlan == 'All') {
          matchesDays = true; // Show all plans
        } else if (_selectedPlan == '5+ Days') {
          matchesDays = int.tryParse(item.days) != null && int.parse(item.days) > 5;
        } else {
          // Extract the number from _selectedPlan (e.g., '2 Days' -> '2')
          final selectedDays = _selectedPlan!.split(' ').first;
          matchesDays = item.days == selectedDays;
        }

        return matchesQuery && matchesDays;
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
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      if (isSearching) {
                        setState(() {
                          isSearching = false;
                          _searchController.clear();
                        });
                      } else {
                        Get.back();
                      }
                    },
                    icon: SvgPicture.asset('assets/icons/bx-arrow-back.svg'),
                  ),
                  if (!isSearching)
                    Text(
                      'Recommended Trip Plans',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.primary_dark_3,
                      ),
                    ),
                  if (isSearching)
                    SizedBox(
                      width: size.width * 0.65,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: AppTheme.colors.primary_dark_3),
                        ),
                        style: TextStyle(color: AppTheme.colors.primary_dark_3),
                        autofocus: true,
                      ),
                    ),
                  IconButton(
                    icon: SvgPicture.asset('assets/icons/bx-search-black.svg'),
                    onPressed: () {
                      setState(() {
                        isSearching = !isSearching;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (!isSearching) ...[
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppTheme.colors.white,
                            border: Border.all(
                                color: AppTheme.colors.primary, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton<String>(
                            value: _selectedPlan,
                            hint: Text(
                              'Select Day Count',
                              style: TextStyle(
                                  color: AppTheme.colors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            items: _plans.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.colors.primary
                                        .withOpacity(0.3),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.colors.primary_dark_3,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedPlan = newValue;
                                _filterPlans(); // Re-filter plans based on selected days
                              });
                            },
                            style: TextStyle(
                              color: AppTheme.colors.black,
                              fontSize: 18,
                            ),
                            icon: Icon(Icons.arrow_drop_down,
                                color: AppTheme.colors.primary),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: _filteredPlans.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    final plan = _filteredPlans[index];
                    return TripPlanCard(
                      plan: plan,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TripPlanDetailsPage(item: plan),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
