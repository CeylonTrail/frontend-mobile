import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/controllers/bottom_nav_bar_controller.dart';

class BackButtonInterceptor extends StatefulWidget {
  final Widget child;

  const BackButtonInterceptor({super.key, required this.child});

  @override
  BackButtonInterceptorState createState() {
    return BackButtonInterceptorState();
  }
}

class BackButtonInterceptorState extends State<BackButtonInterceptor> {
  late BottomNavBarController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<BottomNavBarController>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.onBackButtonPressed();
        return false; // Prevent default back button action
      },
      child: widget.child,
    );
  }
}
