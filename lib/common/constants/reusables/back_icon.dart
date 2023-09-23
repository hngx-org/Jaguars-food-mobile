import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      height: 50.h,
      child: InkWell(
        onTap: () {
          if (context.canPop() == true) {
            context.pop();
            // Navigate back using go_router
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 18.w,
              color: AppColor.backArrowColor,
            ),
            Text(
              'Back',
              style: GoogleFonts.lato(
                color: AppColor.backArrowColor,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
