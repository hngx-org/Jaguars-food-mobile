import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class ButtonWidget extends StatefulWidget {
  final void Function() onPressed;
  final String buttonText;
  final double fontSize;
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.fontSize,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => AppColor.appBrandColor,
            ),
            textStyle: MaterialStateTextStyle.resolveWith(
              (states) => GoogleFonts.lato(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          child: Text(widget.buttonText),
        ),
      ),
    );
  }
}
