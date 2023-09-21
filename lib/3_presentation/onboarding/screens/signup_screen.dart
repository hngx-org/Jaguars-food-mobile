import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/textfield.dart';

import '../../../common/constants/assets_constants.dart';
import '../../../common/constants/route_constant.dart';
import '../../../core/config/router_config.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController _orgController = TextEditingController();
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.only(top: 50.h),
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create an Organization',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: AppColor.appBrandColor)),
            60.verticalSpace,
            CustomTextField(
              headerText: "Enter your Organization name",
              controller: _orgController,
              hintText: 'e.g PricewaterhouseCoopers Ltd.',
            ),
            20.verticalSpace,
            Text(
              'This is the name that would appear to your employees',
              style: GoogleFonts.lato(
                  color: AppColor.subText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400),
            ),
            30.verticalSpace,
            ButtonWidget(
                onPressed: () {
                  routerConfig
                      .pushReplacement(RoutesPath.createOrganizationScreen);
                },
                buttonText: "Next",
                fontSize: 18.sp),
            20.verticalSpace,
            Divider(),
            20.verticalSpace,
            Text('Want to join an existing organization?'),
            20.verticalSpace,
            GestureDetector(
              child: Row(
                children: [
                  SvgPicture.asset(Assets.smallHomeIconPath),
                  10.horizontalSpace,
                  Text("Join with company invite code"),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
