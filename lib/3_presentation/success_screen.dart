import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';
import 'package:jaguar_foods_mobile/core/providers/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../1_data/datasources/remote_datasource.dart';

class SuccessScreen extends StatelessWidget {
  final String? giftee;
  final String? lunchType;

  const SuccessScreen({
    super.key,
    this.giftee,
    this.lunchType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      60.verticalSpace,
                      Expanded(
                        child: Text(
                          giftee == '' || giftee == null
                              ? 'You have succesfully\nwithdrawn your Reward!'
                              : "You have successfullly gifted\n$giftee\nfree $lunchType Lunch",
                          textAlign: TextAlign.center,
                          maxLines: 4,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.lato(
                            color: AppColor.appBrandColor,
                            fontSize: 24.w,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      70.verticalSpace,
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 200.h,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          color: AppColor.imageBackground,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Image.asset(Assets.lunchImagePath),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Gift another employee',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.lato(
                              color: AppColor.appBrandColor,
                              fontSize: 16.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ButtonWidget(
                        onPressed: () async {

                          SharedPreferences prefs = SharedPreferencesManager.preferences;
                          final token = prefs.getString('token');
                          print(token);

                          routerConfig.pushReplacement(RoutesPath.navScreen, extra: {
                            "token": token ?? '',
                            "id": 0,
                          });
                        },
                        buttonText: 'Back to home',
                        fontSize: 14,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 1.h,
                      )),
                    ]),
              ),
              Positioned(
                left: 7.w,
                top: 250.h,
                child: Image.asset(Assets.circleTickImagePath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
