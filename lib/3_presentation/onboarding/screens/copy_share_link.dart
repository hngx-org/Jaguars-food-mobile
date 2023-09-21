import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';

import '../../../common/constants/assets_constants.dart';
import '../../../common/constants/reusables/back_icon.dart';

class CopyShareLink extends StatelessWidget {
  const CopyShareLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackIconWidget(),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: AppColor.appBrandColor),
                  ))
            ],
          ),
          30.verticalSpace,
          Text(
            'Who else is on the PricewaterhouseCoopers Ltd team?',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                color: AppColor.appBrandColor),
          ),
          20.verticalSpace,
          Text(
            'Invite your employees',
            style: GoogleFonts.lato(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          30.verticalSpace,
          ButtonWidget(
            onPressed: () {},
            fontSize: 16.sp,
            buttonText: 'Copy shareable link',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.copyIcon),
                10.horizontalSpace,
                const Text(
                  'Copy shareable link',
                )
              ],
            ),
          ),
          20.verticalSpace,
          ButtonWidget(
            buttonColor: Colors.white,
            onPressed: () {},
            fontSize: 16.sp,
            borderSideColor: AppColor.borderColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.emailIcon),
                10.horizontalSpace,
                const Text('Add by email',
                    style: TextStyle(
                      color: AppColor.black,
                    )),
              ],
            ),
          )
        ],
      ),
    )));
  }
}
