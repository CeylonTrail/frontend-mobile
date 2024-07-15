import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ceylontrailapp/theme/app_theme.dart';

class InfoCard extends StatelessWidget {
  final String imagePath;
  final String name;

  const InfoCard({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        name,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppTheme.colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
