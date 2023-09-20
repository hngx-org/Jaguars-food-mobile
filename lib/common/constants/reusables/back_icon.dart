import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class BackIconWidget extends StatefulWidget {
  final void Function() onPressed;
  const BackIconWidget({
    super.key,
    required this.onPressed,
  });

  @override
  State<BackIconWidget> createState() => _BackIconWidgetState();
}

class _BackIconWidgetState extends State<BackIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: IconButton(
          onPressed: widget.onPressed,
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
