import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/landing_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/screens_barrel.dart';

final GoRouter routerConfig = GoRouter(
  // initialLocation: RoutesPath.redeemScreen,
  initialLocation: RoutesPath.landingScreen,
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
        path: RoutesPath.redeemScreen,
        builder: (context, state) => const RedeemScreen()),
    GoRoute(
        path: RoutesPath.landingScreen,
        builder: (context, state) => const LandingScreen()),
  ],
);
