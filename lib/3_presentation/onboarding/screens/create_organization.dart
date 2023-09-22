import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/reusables/back_icon.dart';
import '../../../common/constants/reusables/textfield.dart';
import '../../../common/constants/route_constant.dart';

class CreateOrganizationScreen extends StatefulWidget {
  const CreateOrganizationScreen({super.key, required this.orgName});
  final String orgName;

  @override
  State<CreateOrganizationScreen> createState() =>
      _CreateOrganizationScreenState();
}

class _CreateOrganizationScreenState extends State<CreateOrganizationScreen> {
  bool _isObscured = true;
  bool _isObscured2 = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                const BackIconWidget(),
                5.verticalSpace,
                Text(
                  'Setup your account',
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
                const CustomTextField(headerText: 'Enter your Email address'),
                10.verticalSpace,
                const CustomTextField(headerText: 'First name'),
                10.verticalSpace,
                const CustomTextField(headerText: 'Last name'),
                10.verticalSpace,
                CustomTextField(
                  headerText: 'Password',
                  obscureText: _isObscured,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    child: _isObscured
                        ? const Icon(
                            Icons.visibility_off_outlined,
                          )
                        : const Icon(Icons.visibility_outlined),
                  ),
                ),
                10.verticalSpace,
                CustomTextField(
                  headerText: 'Confirm password',
                  obscureText: _isObscured2,
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        _isObscured2 = !_isObscured2;
                      });
                    },
                    child: _isObscured2
                        ? const Icon(
                            Icons.visibility_off_outlined,
                          )
                        : const Icon(Icons.visibility_outlined),
                  ),
                ),
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
