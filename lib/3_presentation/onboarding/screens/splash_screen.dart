import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/app_color.dart';
import 'package:jaguar_foods_mobile/common/constants/assets_constants.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  Future<void> _navigateToMainScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      while (routerConfig.canPop() == true) {
        routerConfig.pop();
      }
      routerConfig.pushReplacement(RoutesPath.landingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBrandColor,
      body: Center(
          child: Image.asset(
        Assets.splashImagePath,
        width: MediaQuery.of(context).size.width * 0.5,
      )),
    );
  }
}
