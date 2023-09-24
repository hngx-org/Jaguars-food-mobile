import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/back_icon.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/textfield.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({
    super.key,
    required this.email,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<FormState> _passKey = GlobalKey();
  final GlobalKey<FormState> _otpKey = GlobalKey();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    _otp.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BackIconWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Flexible(
                          child: Text(
                            'We\'ve sent a verification code to your email address',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.lato(
                              color: AppColor.appBrandColor,
                              fontSize: 24.w,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 200.h,
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8F8F8),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFEEEEEE)),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: -50,
                                child: SizedBox(
                                    height: 200.h,
                                    child: Image.asset(Assets.sendImagePath)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Form(
                          key: _otpKey,
                          child: CustomTextField(
                            controller: _otp,
                            onChanged: (value) {
                              _otpKey.currentState!.validate();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required field';
                              } else if (value.length > 6 || value.length < 6) {
                                return 'A six digit code is required';
                              } else {
                                return null;
                              }
                            },
                            headerText: 'Enter code',
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
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
                              } else {
                                return null;
                              }
                            },
                            controller: _password,
                            headerText: 'New Password',
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
                        SizedBox(
                          height: 50.h,
                        ),
                        ButtonWidget(
                          onPressed: () async {
                            if (_otpKey.currentState!.validate() ||
                                _passKey.currentState!.validate()) {
                              CustomDialog().showLoadDialog(context);
                              final response = await Auth.resetPassword(
                                widget.email,
                                _password.text,
                                _otp.text,
                              );

                              routerConfig.pop();
                              if (response.containsValue('error') ||
                                  response.containsValue('fail')) {
                                _showDialog(
                                  'error',
                                  'Error',
                                  response['message'],
                                  'Ok',
                                );
                              } else {
                                _showDialog(
                                  'success',
                                  'Password reset successful',
                                  response['message'],
                                  'Ok',
                                );
                              }
                            }
                          },
                          buttonText: 'Reset password',
                          fontSize: 14.sp,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
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
