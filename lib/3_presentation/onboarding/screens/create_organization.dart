import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/reusables/back_icon.dart';
import '../../../common/constants/reusables/textfield.dart';
import '../../../common/constants/route_constant.dart';

class CreateOrganizationScreen extends StatelessWidget {
  final String companyName;
  const CreateOrganizationScreen({super.key, required this.companyName});

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
                20.verticalSpace,
                Text('Create an Organization',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                        color: AppColor.appBrandColor)),
                20.verticalSpace,
                Text(
                  'PricewaterhouseCoopers Ltd.',
                  style: GoogleFonts.lato(color: AppColor.subText),
                ),
                20.verticalSpace,
                CustomTextFieldWithDropdown(
                  headerText: 'Number of employees',
                  hintText: '50 - 100',
                  dropdownItems: const ['1 - 10', '20-50', '50-100'],
                  onChanged: (String value) {},
                ),
                20.verticalSpace,
                const CustomTextField(headerText: 'Corporate address'),
                20.verticalSpace,
                Row(
                  children: [
                    const Expanded(child: CustomTextField(headerText: 'City')),
                    20.horizontalSpace,
                    Expanded(
                      child: CustomTextFieldWithDropdown(
                        headerText: 'State',
                        hintText: '50 - 100',
                        dropdownItems: const [
                          "Abia",
                          'Adamawa',
                          'Akwa-ibom',
                          'Anambra'
                        ],
                        onChanged: (String value) {},
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                ButtonWidget(
                  onPressed: () {
                    context.push(RoutesPath.copyShareLink, extra: {
                      'companyName': companyName,
                    });
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
                          color: const Color(0xFF475466),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text:
                            'user terms of service, privacy policy, cookie policy,',
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: AppColor.appBrandColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: GoogleFonts.lato(
                          fontSize: 13,
                          color: const Color(0xFF475466),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'AppreciAte supplemental terms.',
                        style: GoogleFonts.lato(
                            fontSize: 13,
                            color: AppColor.appBrandColor,
                            fontWeight: FontWeight.w500),
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
