import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/back_icon.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/textfield.dart';
import '../../../common/constants/route_constant.dart';
import '../../../core/config/router_config.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
              Text('Forgot password',
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
              30.verticalSpace,
              ButtonWidget(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      CustomDialog().showLoadDialog(context);

                      final response = await Auth.forgotPassword(_email.text);
                      routerConfig.pop();

                      if (response.toString().contains('error')) {
                        _showDialog(
                          'error',
                          'Error',
                          response['message'],
                          'Ok',
                        );
                      } else {
                        routerConfig
                            .push(RoutesPath.verificationScreen, extra: {
                          "email": _email.text,
                        });
                      }
                    }
                  },
                  buttonText: "Continue",
                  fontSize: 18.sp),
              20.verticalSpace,
              const Divider(),
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
