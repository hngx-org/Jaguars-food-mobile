import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/3_presentation/confirm_redeem_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/double_lunch.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/redeem_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/success_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/screens_barrel.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/successful_lunch.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: RoutesPath.splashScreen,
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
    GoRoute(
        path: RoutesPath.confirmRedeemScreen,
        builder: (context, state) => const ConfirmRedeemScreen()),
    GoRoute(
        path: RoutesPath.successScreen,
        builder: (context, state) => const SuccessScreen()),
    GoRoute(
        path: RoutesPath.doubleLunchScreen,
        builder: (context, state) => const DoubleLunch()),
    GoRoute(
        path: RoutesPath.successfulLunchScreen,
        builder: (context, state) => const SuccessfulLunchScreen()),
    GoRoute(
        path: RoutesPath.redeemScreen,
        builder: (context, state) => const RedeemScreen()),
  ],
);
