import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SplashScreen',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: AppColor.appBrandColor
          ),
        ),
      ),
    );
  }
}