import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/3_presentation/withdraw_details/withdraw_details.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/screens_barrel.dart';

import '../../common/constants/route_constant.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: RoutesPath.redeemScreen,
  errorBuilder: (context, state) => const Placeholder(),
  routes: [
    GoRoute(
        path: RoutesPath.splashScreen,
        builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: RoutesPath.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen()),
    GoRoute(
        path: RoutesPath.signUpScreen,
        builder: (context, state) => const SignUpScreen()),
    GoRoute(
        path: RoutesPath.loginScreen,
        builder: (context, state) => const LoginScreen()),
  ],
);
