import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/back_icon.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/textfield.dart';

import '../../../common/constants/assets_constants.dart';
import '../../../common/constants/route_constant.dart';
import '../../../core/config/router_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passKey = GlobalKey<FormState>();
  bool _isObscured = true;
  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
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
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIconWidget(),
              Text('Sign in into your Organization',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: AppColor.appBrandColor)),
              40.verticalSpace,
              Form(
                key: _formKey,
                child: CustomTextField(
                  onChanged: (value) {
                    _formKey.currentState!.validate();
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    } else if (!EmailValidator.validate(
                      _email.text,
                      true,
                      true,
                    )) {
                      return 'Invalid email format';
                    } else {
                      return null;
                    }
                  },
                  headerText: 'Enter your Email address',
                  controller: _email,
                ),
              ),
              20.verticalSpace,
              Form(
                key: _passKey,
                child: CustomTextField(
                  onChanged: (value) {
                    _passKey.currentState!.validate();
                  },
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required field';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 digits long';
                    } else {
                      return null;
                    }
                  },
                  controller: _password,
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
              ),
              20.verticalSpace,
              InkWell(
                onTap: () => context.pushReplacement(RoutesPath.signUpScreen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () =>
                          context.push(RoutesPath.forgotPasswordScreen),
                      child: Text(
                        "Forgot password?",
                        style: GoogleFonts.lato(
                          color: AppColor.appBrandColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              30.verticalSpace,
              ButtonWidget(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        _passKey.currentState!.validate()) {
                      CustomDialog().showLoadDialog(context);

                      final loginResponse = await Auth.login(
                        _email.text.trim(),
                        _password.text,
                      );
                      routerConfig.pop();

                      if (loginResponse.toString().contains('error')) {
                        _showDialog(
                          'error',
                          'Error',
                          loginResponse['message'],
                          'Ok',
                        );
                      } else {
                        while (routerConfig.canPop()) {
                          routerConfig.pop();
                        }
                        routerConfig
                            .pushReplacement(RoutesPath.navScreen, extra: {
                          "token": loginResponse['token'],
                          "id": 0,
                        });
                      }
                    }
                  },
                  buttonText: "Sign in",
                  fontSize: 18.sp),
              20.verticalSpace,
              const Divider(),
              20.verticalSpace,
              Text(
                'Not part of an existing organization?',
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
                    15.horizontalSpace,
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
              ),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () => context.pushReplacement(RoutesPath.signUpScreen),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.addIcon),
                    10.horizontalSpace,
                    Text(
                      "Create a new organization",
                      style: GoogleFonts.lato(
                        color: const Color(0xFF475466),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  _showDialog(
    String type,
    String title,
    String body,
    String buttontext,
  ) {
    CustomDialog().showAlertDialog(
      context,
      type,
      title,
      body,
      buttontext,
    );
  }
}
