import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/create_organization.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/nav_screen/nav_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';

import '../../../common/constants/reusables/back_icon.dart';

class RegisterOrgNameScreen extends StatefulWidget {
  const RegisterOrgNameScreen({super.key});


  @override
  State<RegisterOrgNameScreen> createState() => _RegisterOrgNameScreenState();
}

class _RegisterOrgNameScreenState extends State<RegisterOrgNameScreen> {
  final orgNameController = TextEditingController();

  final String orgName = '';
  String errorText = '';

  @override
  void initState() {
    super.initState();
    orgNameController.text = orgName;
  }

  void validateInput() {
    final inputText = orgNameController.text.trim();

    if (inputText.isEmpty) {
      setState(() {
        errorText = 'Please enter an organization name';
      });
    } else {
      setState(() {
        errorText = '';
      });

      Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (BuildContext context) {
            return CreateOrganizationScreen(orgName: inputText);
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    orgNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          height: mediaQuery.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackIconWidget(),
                40.verticalSpace,
                Text(
                  'Create an Organization',
                  style: TextStyle(
                    color: Color(0xFF571FCD),
                    fontSize: 24,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                40.verticalSpace,
                Text(
                  'Enter your Organization name',
                  style: TextStyle(
                    color: Color(0xFF475466),
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.10,
                  ),
                ),
                20.verticalSpace,
                TextField(
                  controller: orgNameController,
                  style: TextStyle(color: AppColor.appBrandColor),
                  decoration: InputDecoration(
                    label: SizedBox(
                      width: mediaQuery.width * 0.8,
                      child: Text(
                        'e.g PricewaterhouseCoopers Ltd.',
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
                      borderSide:
                      BorderSide(width: 2, color: AppColor.appBrandColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(width: 2, color: AppColor.appBrandColor),
                    ),
                  ),
                ),
                20.verticalSpace,
                Text(
                  errorText,
                  style: TextStyle(color: Colors.red),
                ),
                40.verticalSpace,
                Text(
                  'This is the name that would appear to your employees',
                  style: TextStyle(
                    color: Color(0xFF5C636F),
                    fontSize: 13,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
                40.verticalSpace,
                ButtonWidget(
                  onPressed: validateInput,
                  buttonText: 'Next',
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
