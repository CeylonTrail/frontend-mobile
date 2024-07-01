import 'package:flutter/material.dart';

class CustomScaffoldLoading extends StatelessWidget {
  const CustomScaffoldLoading({super.key, required this.loadingScreen});
  final Widget loadingScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Image.asset('assets/images/ceylontrail_loading.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,),
             SafeArea(
              child: loadingScreen,
            )

          ],
        )
    );
  }
}