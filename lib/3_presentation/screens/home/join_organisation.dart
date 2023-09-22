import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/reusables/back_icon.dart';
import '../../../common/constants/reusables/textfield.dart';
import '../../../common/constants/route_constant.dart';

class StaffLoginScreen extends StatefulWidget {
  const StaffLoginScreen({super.key, required this.orgName});
  final String orgName;

  @override
  State<StaffLoginScreen> createState() => _StaffLoginScreenState();
}

class _StaffLoginScreenState extends State<StaffLoginScreen> {
  bool _isObscured = true;
  bool _isObscured2 = true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
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
                  'Exxon-mobil is inviting you to join their organization',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: AppColor.appBrandColor,
                  ),
                ),
                20.verticalSpace,
                const CustomTextField(headerText: 'First name'),
                10.verticalSpace,
                const CustomTextField(headerText: 'Last name'),
                10.verticalSpace,
                TextField(
                  style: GoogleFonts.lato(
                    color: AppColor.appBrandColor,
                  ),
                  decoration: InputDecoration(
                    label: SizedBox(
                      width: mediaQuery.width * 0.8,
                      child: const Text(
                        'exampl@work-mail.com',
                        style: TextStyle(
                          color: Color(0xFF98A1B2),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          width: 2, color: AppColor.appBrandColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                          width: 2, color: AppColor.appBrandColor),
                    ),
                  ),
                ),
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
                  buttonText: 'Join Organisation',
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
