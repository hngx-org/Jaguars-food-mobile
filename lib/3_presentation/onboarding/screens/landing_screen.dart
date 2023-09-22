import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/create_organization.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool button2 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(Assets.splashImagePath)),
              FancyButton(
                  text: 'Create your Organization',
                  onTapped: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CreateOrganizationScreen();
                        },
                      ),
                    );

                  }, isCreate: true,),
              FancyButton(
                text: 'Join an existing Organization',
                isCreate: false,
                onTapped: () {

                },
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
                    height: 0.11,
                    letterSpacing: -0.16,
                  ),
                ),
              ),
          SizedBox(height: 30,)
        ],
      ),
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
      required this.onTapped, required this.isCreate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: isCreate ? AppColor.appBrandColor : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            //border: BoxShadow()
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: isCreate ? Colors.white : AppColor.appBrandColor),
            ),
          ),
        ),
      ),
    );
  }
}
