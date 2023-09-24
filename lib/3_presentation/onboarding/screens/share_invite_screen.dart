import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/1_data/datasources/remote_datasource.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/custom_error_dialog.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

import '../../../common/constants/assets_constants.dart';
import '../../../common/constants/reusables/back_icon.dart';

class ShareInviteScreen extends StatefulWidget {
  final String orgName;
  final String token;
  const ShareInviteScreen({
    super.key,
    required this.orgName,
    required this.token,
  });

  @override
  State<ShareInviteScreen> createState() => _ShareInviteScreenState();
}

class _ShareInviteScreenState extends State<ShareInviteScreen> {
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _emailKey = GlobalKey();
  final List _inviteList = [];
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackIconWidget(),
              TextButton(
                  onPressed: () {
                    while (context.canPop()) {
                      context.pop();
                    }
                    context.pushReplacement(RoutesPath.navScreen, extra: {
                      "token": widget.token,
                      "id": 0,
                    });
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColor.appBrandColor),
                  ))
            ],
          ),
          30.verticalSpace,
          Form(
            key: _emailKey,
            child: TextFormField(
              onTapOutside: (event) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required field';
                } else if (!EmailValidator.validate(value)) {
                  return 'Invalid email format';
                } else if (_inviteList.contains(value)) {
                  return 'Already exists';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                _emailKey.currentState!.validate();
              },
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.done,
              cursorColor: AppColor.appBrandColor,
              decoration: InputDecoration(
                  suffix: InkWell(
                    onTap: () {
                      if (_email.text.isNotEmpty &&
                          EmailValidator.validate(_email.text) &&
                          _emailKey.currentState!.validate()) {
                        setState(() {
                          _inviteList.add(_email.text);
                        });
                        _email.clear();
                      }
                    },
                    child: const Text(
                      '+ Add to Org',
                    ),
                  ),
                  suffixStyle: GoogleFonts.lato(
                    color: AppColor.appBrandColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  labelStyle: GoogleFonts.lato(
                    color: const Color(0xFF475466),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  hintStyle: GoogleFonts.lato(
                    fontSize: 16.sp,
                    color: AppColor.hinttextfieldColor,
                  ),
                  hintText: 'Boluwatife@example.com',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.w,
                      color: const Color(
                        0xFFCFD4DC,
                      ),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.w,
                      color: AppColor.appBrandColor,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.w,
                      color: Colors.red,
                    ),
                  )),
            ),
          ),
          30.verticalSpace,
          Text(
            'Added employees (${_inviteList.length})',
            style: GoogleFonts.lato(
              color: const Color(0xFF475467),
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          30.verticalSpace,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _inviteList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _inviteList.elementAt(index),
                        style: GoogleFonts.lato(
                          color: const Color(0xFF475467),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _inviteList.removeAt(index);
                          });
                        },
                        child: Text(
                          'Remove',
                          style: GoogleFonts.lato(
                            color: Colors.red,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ButtonWidget(
            onPressed: _inviteList.isEmpty
                ? null
                : () async {
                    if (_inviteList.isNotEmpty) {
                      CustomDialog().showLoadDialog(context);
                      final response = await Auth.staffInvite(
                        //TODO: to make it a list
                        _inviteList.elementAt(0),
                        widget.token,
                      );
                      if (response.containsValue('error') ||
                          response.containsValue('fail')) {
                        routerConfig.pop();
                        _showDialog(
                          'error',
                          'Error',
                          response['message'],
                          'Ok',
                        );
                      } else {
                        routerConfig.pop();
                        _showDialog(
                          'success',
                          'Success',
                          response['message'],
                          'Ok',
                        );
                        setState(() {
                          _inviteList.clear();
                        });
                      }
                    }
                  },
            fontSize: 16.sp,
            buttonText: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.sendIcon),
                10.horizontalSpace,
                Text(
                  'Send invites',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          1.verticalSpace,
          60.verticalSpace,
        ],
      ),
    )));
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
