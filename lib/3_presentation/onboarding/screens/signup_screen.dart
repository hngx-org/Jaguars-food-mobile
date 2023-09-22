import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/textfield.dart';

import '../../../common/constants/assets_constants.dart';
import '../../../common/constants/route_constant.dart';
import '../../../core/config/router_config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController orgController = TextEditingController();

  @override
  void dispose() {
    orgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
          margin: EdgeInsets.only(top: 50.h),
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create an Organization',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: AppColor.appBrandColor)),
              50.verticalSpace,
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
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                  headerText: "Enter your Organization name",
                  controller: orgController,
                  hintText: 'e.g PricewaterhouseCoopers Ltd.',
                  keyboardType: TextInputType.text,
                ),
              ),
              20.verticalSpace,
              Text(
                'This is the name that would appear to your employees',
                style: GoogleFonts.lato(
                    color: AppColor.subText,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
              ),
              30.verticalSpace,
              ButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      routerConfig
                          .push(RoutesPath.createOrganizationScreen, extra: {
                        'companyName': orgController.text,
                      });
                    }
                  },
                  buttonText: "Next",
                  fontSize: 18.sp),
              20.verticalSpace,
              const Divider(),
              20.verticalSpace,
              Text(
                'Want to join an existing organization?',
                style: GoogleFonts.lato(
                  color: const Color(0xFF475466),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              20.verticalSpace,
              GestureDetector(
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.smallHomeIconPath),
                    10.horizontalSpace,
                    Text(
                      "Join with company invite code",
                      style: GoogleFonts.lato(
                        color: const Color(0xFF475466),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
