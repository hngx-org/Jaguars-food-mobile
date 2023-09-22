import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class ButtonWidget extends StatefulWidget {
  final void Function() onPressed;
  final String buttonText;
  final double fontSize;
  final bool? iconAllowed;
  final Icon? icon;
  final Color? textColor;
  final Color? borderColor;
  final Color? bgColor;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.fontSize, this.icon , this.iconAllowed = false, this.textColor, this.borderColor, this.bgColor,
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
        height: 65.h,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => widget.bgColor ?? AppColor.appBrandColor,
            ),
            textStyle: MaterialStateTextStyle.resolveWith(
              (states) => GoogleFonts.lato(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              (states) => RoundedRectangleBorder(
                side: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.iconAllowed == false ? const SizedBox.shrink() : widget.icon ?? const SizedBox.shrink() ,
              10.horizontalSpace,
              Text(widget.buttonText, style: TextStyle(color: widget.textColor ?? Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
