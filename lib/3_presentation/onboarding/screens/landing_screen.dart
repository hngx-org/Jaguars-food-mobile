import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/create_organization.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/org_name_register.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool button2 = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            60.verticalSpace,
            Text(
              'Welcome to AppreciAte',
              style: GoogleFonts.lato(
                color: const Color(0xFF571FCD),
                fontSize: 29,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Gift employees and co-workers',
              style: GoogleFonts.lato(
                color: const Color(0xFF98A1B2),
                fontSize: 18.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            40.verticalSpace,
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/png/people.png'),
            ),
            80.verticalSpace,
            FancyButton(
              text: 'Create your Organization',
              onTapped: () {
                Navigator.of(context).push(
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) {
                      return RegisterOrgNameScreen();
                    },
                  ),
                );
              },
              isCreate: true,
            ),
            FancyButton(
              text: 'Join an existing Organization',
              isCreate: false,
              onTapped: () {},
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              child: Text(
                'Sign into your organization',
                style: TextStyle(
                  color: Color(0xFF571FCD),
                  fontSize: 16,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      )),
    );
  }
}

class FancyButton extends StatelessWidget {
  final String text;
  final bool isCreate;
  final VoidCallback onTapped;
  const FancyButton(
      {super.key,
      required this.text,
      required this.isCreate,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            color: isCreate ? AppColor.appBrandColor : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            //border: BoxShadow()
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: isCreate ? Colors.white : AppColor.appBrandColor),
            ),
          ),
        ),
      ),
    );
  }
}
