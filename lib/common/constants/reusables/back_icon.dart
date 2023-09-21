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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        // width: double.infinity,
        height: 50.h,
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColor.black,
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 18.w,
          ),
        ),
      ),
    );
  }
}
