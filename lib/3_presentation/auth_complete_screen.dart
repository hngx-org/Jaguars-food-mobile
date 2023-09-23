import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class AuthCompleteScreen extends StatelessWidget {
  final String orgName;
  final String token;
  const AuthCompleteScreen({
    super.key,
    required this.orgName,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                Text(
                  'Hurray! Your organization is all set up',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 200.h,
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Image.asset(Assets.buildingImagePath),
                ),
                SizedBox(
                  height: 37.h,
                ),
                Text(
                  orgName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: const Color(0xff98a2b3),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 65.h,
                ),
                TextButton(
                  onPressed: () =>
                      context.push(RoutesPath.shareInviteScreen, extra: {
                    'companyName': orgName,
                    'token': token,
                  }),
                  child: Text(
                    'Invite members',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      color: AppColor.appBrandColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ButtonWidget(
                  onPressed: () {
                    while (routerConfig.canPop() == true) {
                      routerConfig.pop();
                    }
                    routerConfig.pushReplacement(RoutesPath.navScreen);
                  },
                  buttonText: 'Get Started',
                  fontSize: 16.sp,
                ),
              ],
            ),
          ),
          Positioned(
            left: 7.w,
            top: 260.h,
            child: Image.asset(
              Assets.circleTickImagePath,
            ),
          ),
        ],
      ),
    );
  }
}
