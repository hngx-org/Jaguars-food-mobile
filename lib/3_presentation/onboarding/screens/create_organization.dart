import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/reusables/back_icon.dart';

class CreateOrganizationScreen extends StatelessWidget {
  const CreateOrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIconWidget(),
              20.verticalSpace,
              Text('Create an Organization',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: AppColor.appBrandColor)),
              60.verticalSpace,
              const Text('PricewaterhouseCoopers Ltd.'),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
