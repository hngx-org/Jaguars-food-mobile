import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/back_icon.dart';
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
  bool _orgIsTaken = false;
  bool _isLoading = true;
  bool _isError = false;

  @override
  void dispose() {
    orgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIconWidget(),
            10.verticalSpace,
            Text('Create an Organization',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: AppColor.appBrandColor)),
            40.verticalSpace,
            Form(
              key: _formKey,
              child: CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required field';
                  } else if (_orgIsTaken) {
                    return 'Organisation already exists';
                  } else if (_isError) {
                    return 'A server error has occured';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) async {
                  setState(() {
                    _isLoading = true;
                  });
                  if (value.isEmpty) {
                  } else {
                    final response = await Auth.orgExists(value);

                    if (response.toString() == 'true') {
                      setState(() {
                        _orgIsTaken = false;
                        _isError = false;
                      });
                    } else if (response.toString().contains('server error')) {
                      setState(() {
                        _isError = true;
                      });
                    } else {
                      setState(() {
                        _orgIsTaken = true;
                      });
                    }
                  }

                  setState(() {
                    _isLoading = false;
                  });
                  _formKey.currentState!.validate();
                },
                suffix: orgController.text.isEmpty
                    ? null
                    : _isLoading
                        ? SizedBox(
                            width: 15.w,
                            height: 15.h,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5.w,
                            ),
                          )
                        : _orgIsTaken
                            ? Icon(
                                Icons.cancel_rounded,
                                color: Colors.red,
                                size: 16.w,
                              )
                            : Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.green,
                                size: 16.w,
                              ),
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
                fontWeight: FontWeight.w400,
              ),
            ),
            30.verticalSpace,
            ButtonWidget(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  routerConfig.push(RoutesPath.adminSignUp, extra: {
                    'companyName': orgController.text,
                  });
                }
              },
              buttonText: "Next",
              fontSize: 18.sp,
            ),
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
            InkWell(
              onTap: () =>
                  context.pushReplacement(RoutesPath.joinOrganizationScreen),
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
    );
  }
}
