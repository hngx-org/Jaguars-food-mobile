import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class _CreateOrganizationScreenState extends State<CreateOrganizationScreen>
    with AutomaticKeepAliveClientMixin<CreateOrganizationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<FormState> _nameKey = GlobalKey();
  final GlobalKey<FormState> _lNameKey = GlobalKey();
  final GlobalKey<FormState> _phoneKey = GlobalKey();
  final GlobalKey<FormState> _passKey = GlobalKey();
  final GlobalKey<FormState> _cPassKey = GlobalKey();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  bool _isObscured = true;
  bool _isObscured2 = true;

  @override
  void dispose() {
    _email.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    onChanged: (value) {
                      _formKey.currentState!.validate();
                    },
                    textInputAction: TextInputAction.next,
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
                10.verticalSpace,
                Form(
                  key: _nameKey,
                  child: CustomTextField(
                    onChanged: (value) {
                      _nameKey.currentState!.validate();
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      } else {
                        return null;
                      }
                    },
                    headerText: 'First name',
                    controller: _firstName,
                  ),
                ),
                10.verticalSpace,
                Form(
                  key: _lNameKey,
                  child: CustomTextField(
                    onChanged: (value) {
                      _lNameKey.currentState!.validate();
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      } else {
                        return null;
                      }
                    },
                    headerText: 'Last name',
                    controller: _lastName,
                  ),
                ),
                10.verticalSpace,
                Form(
                  key: _phoneKey,
                  child: CustomTextField(
                    onChanged: (value) async {
                      _phoneKey.currentState!.validate();
                      if (_phone.text.length == 11) {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      }
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      } else {
                        return null;
                      }
                    },
                    hintText: '09036727573',
                    headerText: 'Phone number',
                    controller: _phone,
                  ),
                ),
                10.verticalSpace,
                Form(
                  key: _passKey,
                  child: CustomTextField(
                    onChanged: (value) {
                      _passKey.currentState!.validate();
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
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
                10.verticalSpace,
                Form(
                  key: _cPassKey,
                  child: CustomTextField(
                    onChanged: (value) {
                      _cPassKey.currentState!.validate();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required field';
                      } else if (_password.text.trim() !=
                          _confirmPassword.text.trim()) {
                        return 'Password not match';
                      } else {
                        return null;
                      }
                    },
                    textInputAction: TextInputAction.done,
                    controller: _confirmPassword,
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
                ),
                30.verticalSpace,
                ButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _nameKey.currentState!.validate() &&
                        _lNameKey.currentState!.validate() &&
                        _phoneKey.currentState!.validate() &&
                        _passKey.currentState!.validate() &&
                        _cPassKey.currentState!.validate()) {
                      context.push(RoutesPath.setLunchPriceScreen, extra: {
                        'companyName': widget.orgName,
                        "email": _email.text.trim(),
                        "password": _password.text,
                        "first_name": _firstName.text.trim(),
                        "last_name": _lastName.text.trim(),
                        "phone_number": _phone.text.trim(),
                      });
                    }
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

  @override
  bool get wantKeepAlive => true;
}
