import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/reusables/back_icon.dart';
import '../../../common/constants/reusables/textfield.dart';
import '../../../common/constants/route_constant.dart';
import '../../../core/config/router_config.dart';

class CreateOrganizationScreen extends StatelessWidget {
  const CreateOrganizationScreen({super.key});

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
                BackIconWidget(),
                20.verticalSpace,
                Text('Create an Organization',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                        color: AppColor.appBrandColor)),
                30.verticalSpace,
                Text(
                  'PricewaterhouseCoopers Ltd.',
                  style: GoogleFonts.lato(color: AppColor.subText),
                ),
                30.verticalSpace,
                CustomTextFieldWithDropdown(
                  headerText: 'Number of employees',
                  hintText: '50 - 100',
                  dropdownItems: [" ", '1 - 10', '20-50', '50-100'],
                  onChanged: (String value) {},
                ),
                30.verticalSpace,
                CustomTextField(headerText: 'Corporate address'),
                30.verticalSpace,
                Row(
                  children: [
                    Expanded(child: CustomTextField(headerText: 'City')),
                    20.horizontalSpace,
                    Expanded(
                      child: CustomTextFieldWithDropdown(
                        headerText: 'State',
                        hintText: '50 - 100',
                        dropdownItems: [" ", '1 - 10', '20-50', '50-100'],
                        onChanged: (String value) {},
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                ButtonWidget(
                    onPressed: () {
                      routerConfig.pushReplacement(RoutesPath.copyShareLink);
                    },
                    buttonText: 'Create Organization',
                    fontSize: 18.sp),
                30.verticalSpace,
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'By continuing, you’re agreeing to the app ',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.greyColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text:
                            'user terms of service, privacy policy, cookie policy,',
                        style: TextStyle(
                          color: AppColor.appBrandColor,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColor.greyColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: 'AppreciAte supplemental terms.',
                        style: TextStyle(
                          color: AppColor.appBrandColor,
                          fontSize: 13,
                          decoration: TextDecoration.none,
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
