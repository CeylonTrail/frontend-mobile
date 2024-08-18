import 'package:ceylontrailapp/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../theme/app_theme.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                          Get.back();
                        },
                        icon:
                            SvgPicture.asset('assets/icons/bx-arrow-back.svg'),
                      ),
                      Text(
                        'Messages',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.colors.primary_dark_3),
                      )
                    ],
                  ),
                  SvgPicture.asset('assets/icons/bx-search-black.svg')
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'People',
                      style: TextStyle(
                          color: AppTheme.colors.primary_dark_3, fontSize: 16),
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
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ),
                              Text('FName',
                              style: TextStyle(
                                color: AppTheme.colors.primary_dark_3,
                                fontSize: 14
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8,),
            Container(
              width: double.infinity,
              height:  size.height * 0.74,
              decoration: BoxDecoration(
                color: AppTheme.colors.secondary_light_1.withOpacity(0.5),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), )
              ),
              child: ListView.builder(
                itemCount: 1, // Adjust the item count as needed
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: GestureDetector(
                            onTap:(){
                              Get.to(()=>  ChatScreen());
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Full Name',
                                  style: TextStyle(
                                    color: AppTheme.colors.primary_dark_3,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Last Sent or received message',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.colors.primary_dark_3,
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

            )
          ],
        ),
      )),
    );
  }
}
