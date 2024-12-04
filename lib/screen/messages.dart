import 'package:ceylontrailapp/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../theme/app_theme.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  MessagesState createState() => MessagesState();
}

class MessagesState extends State<Messages> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Retrieve logged-in user details using GetX
    final loginController = Get.find<LoginController>();
    _firstNameController.text = loginController.firstname.value;
    _usernameController.text = loginController.username.value;
    _lastNameController.text = loginController.lastname.value;
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (isSearching) {
                            setState(() {
                              isSearching = false;
                              searchController.clear();
                            });
                          } else {
                            Get.back();
                          }
                        },
                        icon:
                            SvgPicture.asset('assets/icons/bx-arrow-back.svg'),
                      ),
                      if (!isSearching)
                        Text(
                          'Messages',
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
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: AppTheme.colors.primary_dark_3),
                            ),
                            style: TextStyle(
                                color: AppTheme.colors.primary_dark_3),
                            autofocus: true,
                            onChanged: (value) {
                              // Implement search logic here
                            },
                          ),
                        ),
                    ],
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
              // Display the normal content
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'People',
                        style: TextStyle(
                          color: AppTheme.colors.primary_dark_3,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.5),
                            child: Column(
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    width:80,
                                    height: 80,
                                    child: Image.asset(
                                      "assets/images/traveller.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${_firstNameController.text}',
                                  style: TextStyle(
                                    color: AppTheme.colors.primary_dark_3,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.colors.secondary_light_1.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 1, // Adjust the item count as needed
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10),
                        child: Row(
                          children: [
                            // ClipOval(
                            //   child: SizedBox(
                            //     width:70,
                            //     height: 70,
                            //     child: Image.asset(
                            //       "assets/images/traveller.jpg",
                            //       fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => ChatScreen());
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'No followers or followings yet',
                                      style: TextStyle(
                                        color: AppTheme.colors.primary_dark_3,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.73,
                                      child: Text(
                                        '',
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.colors.primary_dark_3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
