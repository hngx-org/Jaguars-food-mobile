import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/nav_screen/nav_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/reusables/button.dart';

import '../../../common/constants/reusables/back_icon.dart';

class InviteEmployeesScreen extends StatefulWidget {
  const InviteEmployeesScreen({super.key, required this.orgName});

  final String orgName;

  @override
  State<InviteEmployeesScreen> createState() => _InviteEmployeesScreenState();
}

class _InviteEmployeesScreenState extends State<InviteEmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          height: mediaQuery.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackIconWidget(),
              60.verticalSpace,
              Text(
                'Who else is on the ${widget.orgName} team?',
                style: TextStyle(
                  color: Color(0xFF571FCD),
                  fontSize: 24,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                ),
              ),
              40.verticalSpace,
              Text(
                'Invite your employees',
                style: TextStyle(
                  color: Color(0xFF98A1B2),
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  height: 0.08,
                ),
              ),
              60.verticalSpace,
              ButtonWidget(
                  onPressed: () {},
                  buttonText: 'Copy shareable link',
                  fontSize: 20,
                  iconAllowed: true,
              icon: Icon(Icons.ios_share),),
              ButtonWidget(
                  onPressed: () {},
                  buttonText: 'Add by email',
                  fontSize: 20,
                  bgColor: Colors.white,
                  borderColor: AppColor.appBrandColor,
                  iconAllowed: true, textColor: AppColor.appBrandColor,
              icon: Icon(CupertinoIcons.mail, color: AppColor.appBrandColor,)),
              60.verticalSpace,
              ButtonWidget(onPressed: (){
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) {
                      return NavigationScreen(initialIndex: 0);
                    },
                  ),
                );
              }, buttonText: 'Continue', fontSize: 18)
          
            ],
          ),
        ),
      ),
    );
  }
}
