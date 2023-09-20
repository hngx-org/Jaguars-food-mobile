import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class SuccessfulLunchScreen extends StatelessWidget {
  final String? giftee;
  final String? lunchType;

  const SuccessfulLunchScreen({
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => routerConfig.pop(),
                            child: Icon(
                              Icons.close,
                              size: 20.w,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 1.h,
                      )),
                      Flexible(
                        child: Text(
                          'You successfully gifted Adekunle Emmanuel free Double lunch!',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.lato(
                            color: AppColor.appBrandColor,
                            fontSize: 28.w,
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
                        onPressed: () {
                          while (routerConfig.canPop() == true) {
                            routerConfig.pop();
                          }
                          routerConfig.pushReplacement(RoutesPath.splashScreen);
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
                child: Image.asset(Assets.checkImagePath),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
