import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome to AppreciAte',
            style: GoogleFonts.lato(
              color: const Color(0xFF571FCD),
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Gift employees and co-workers',
            style: GoogleFonts.lato(
              color: const Color(0xFF98A1B2),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: height * 0.075,
          ),
          SizedBox(
            height: 200,
            width: 200,
            child: Image.asset(Assets.peopleImagePath),
          ),
          SizedBox(
            height: height * 0.125,
          ),
          ButtonWidget(
            onPressed: () => context.push(RoutesPath.signUpScreen),
            fontSize: 16.sp,
            buttonText: 'Create your organisation',
          ),
          SizedBox(
            height: 10.h,
          ),
          ButtonWidget(
            onPressed: () => context.push(RoutesPath.signUpScreen),
            fontSize: 16,
            buttonText: 'Join an existing organization',
            buttonColor: Colors.transparent,
            borderSideColor: AppColor.borderColor,
            textColor: AppColor.appBrandColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sign into your organization',
              style: GoogleFonts.lato(
                color: AppColor.appBrandColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
        ],
      ),
    ));
  }
}
