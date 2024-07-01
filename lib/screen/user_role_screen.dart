import 'package:ceylontrailapp/widgets/custom_scaffold_loading.dart';
import 'package:ceylontrailapp/widgets/sign_up_button.dart';
import 'package:ceylontrailapp/widgets/sign_in_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRoleScreen extends StatelessWidget {
  const UserRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffoldLoading(loadingScreen: Scaffold(
     appBar: AppBar(
       leading: BackButton(
         onPressed: ,
       ),
     ),
    ));
  }
}
