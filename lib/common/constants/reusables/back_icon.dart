import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class BackIconWidget extends StatelessWidget {
  final GoRouter? router;
  const BackIconWidget({super.key, this.router});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 50.h,
      child: GestureDetector(
        onTap: () {
          if (router?.canPop() == true) {
            router?.pop(); // Navigate back using go_router
          } else {
            print("No pages left to pop.");
          }
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 18.w,
              color: AppColor.backArrowColor,
            ),
            Text(
              'Back',
              style: TextStyle(color: AppColor.backArrowColor),
            )
          ],
        ),
      ),
    );
  }
}
