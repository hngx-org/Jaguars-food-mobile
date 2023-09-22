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
  final String orgName;
  final String password;
  final String firstName;
  final String email;
  final String lastName;
  final String phoneNumber;
  final String confirmPassword;

  const SetLunchPriceScreen({
    super.key,
    required this.orgName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  @override
  State<SetLunchPriceScreen> createState() => _SetLunchPriceScreenState();
}

class _SetLunchPriceScreenState extends State<SetLunchPriceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _priceController = TextEditingController();

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
                  style: GoogleFonts.lato(
                    color: AppColor.subText,
                  ),
                ),
                20.verticalSpace,
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      } else {
                        return null;
                      }
                    },
                    hintText: '0.00',
                    keyboardType: TextInputType.number,
                    headerText: 'Enter lunch price',
                    prefix: Container(
                      margin: EdgeInsets.only(
                        left: 1.h,
                        right: 20.w,
                        bottom: 1.h,
                        top: 1.h,
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
                      child: const Text(
                        '₦',
                        style: TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
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
                    //TODO: call register api
                    context.push(RoutesPath.copyShareLink,
                        extra: {'companyName': widget.orgName});
                  },
                  buttonText: 'Create Organization',
                  fontSize: 16.sp,
                ),
                30.verticalSpace,
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'By continuing, you’re agreeing to the app ',
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: AppColor.greyColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text:
                            'user terms of service, privacy policy, cookie policy,',
                        style: GoogleFonts.lato(
                          color: AppColor.appBrandColor,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: AppColor.greyColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'AppreciAte supplemental terms.',
                        style: GoogleFonts.lato(
                          color: AppColor.appBrandColor,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
