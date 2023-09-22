import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/back_icon.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/textfield.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class VerificationScreen extends StatelessWidget {
  final String? orgName;
  final String? lunchType;

  const VerificationScreen({
    super.key,
    this.orgName,
    this.lunchType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BackIconWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Flexible(
                          child: Text(
                            'We\'ve sent a verification code to your email address',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.lato(
                              color: AppColor.appBrandColor,
                              fontSize: 24.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 200.h,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFEEEEEE)),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: -50,
                                child: SizedBox(
                                    height: 200.h,
                                    child: Image.asset(Assets.sendImagePath)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        const CustomTextField(
                          headerText: 'Enter code',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        ButtonWidget(
                          onPressed: () {
                            routerConfig
                                .push(RoutesPath.setLunchPriceScreen, extra: {
                              "companyName": orgName,
                            });
                          },
                          buttonText: 'Verify',
                          fontSize: 14,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
