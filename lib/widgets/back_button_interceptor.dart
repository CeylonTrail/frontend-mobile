import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ceylontrailapp/controllers/bottom_nav_bar_controller.dart';

class PopScope extends StatelessWidget {
  final Future<bool> Function() onWillPop;
  final Widget child;

  const PopScope({
    super.key,
    required this.onWillPop,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          // Intercept back swipe gesture
          _handlePop(context);
        }
      },
      child: child,
    );
  }

  void _handlePop(BuildContext context) async {
    final shouldPop = await onWillPop();
    if (shouldPop) {
      Navigator.of(context).pop();
    }
  }
}

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
    return PopScope(
      onWillPop: () async {
        controller.onBackButtonPressed();
        return false; // Prevent default back button action
      },
      child: widget.child,
    );
  }
}
