import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/reusables/back_icon.dart';
import '../../../common/constants/reusables/textfield.dart';
import '../../../common/constants/route_constant.dart';

class SetLunchPriceScreen extends StatefulWidget {
  const SetLunchPriceScreen({super.key, required this.orgName});
  final String orgName;

  @override
  State<SetLunchPriceScreen> createState() => _SetLunchPriceScreenState();
}

class _SetLunchPriceScreenState extends State<SetLunchPriceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackIconWidget(),
                5.verticalSpace,
                Text(
                  'Set organization lunch Price',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: AppColor.appBrandColor,
                  ),
                ),
                5.verticalSpace,
                Text(
                  widget.orgName,
                  style: GoogleFonts.lato(color: AppColor.subText),
                ),
                20.verticalSpace,
                CustomTextField(
                  headerText: 'Enter your Email address',
                  prefix: Container(
                    margin: const EdgeInsets.only(
                      left: 1,
                      right: 20,
                    ),
                    width: 50.w,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      color: Color(0xFFF2F2F2),
                    ),
                    child: Text(
                      '₦',
                      style: GoogleFonts.lato(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                5.verticalSpace,
                Text('This is the amount per lunch at your organization',
                    style: GoogleFonts.lato(
                      color: AppColor.subText,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    )),
                30.verticalSpace,
                ButtonWidget(
                  onPressed: () {
                    context.push(RoutesPath.verificationScreen,
                        extra: {'companyName': widget.orgName});
                  },
                  buttonText: 'Next',
                  fontSize: 16.sp,
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
