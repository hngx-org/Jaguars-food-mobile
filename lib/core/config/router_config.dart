import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/3_presentation/auth_complete_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/double_lunch/double_lunch.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/landing_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/org_name_register.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/send_lunch_deal.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/successful_lunch.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/employee_screen/employee_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/home/home_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/nav_screen/nav_screen.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/screens_barrel.dart';
import '../../3_presentation/confirm_redeem_screen.dart';
import '../../3_presentation/redeem_screen.dart';
import '../../3_presentation/success_screen.dart';
import '../../3_presentation/onboarding/screens/copy_share_link.dart';
import '../../3_presentation/onboarding/screens/create_organization.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: RoutesPath.splashScreen,
  errorBuilder: (context, state) => const Placeholder(),
  routes: [
    GoRoute(
      path: RoutesPath.splashScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const SplashScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.onBoardingScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const OnBoardingScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.sendLunchDealScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const SendLunchDealScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.signUpScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const SignUpScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.loginScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const LoginScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.homeScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const HomeScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.navScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const NavigationScreen(
          initialIndex: 0,
        ),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.confirmRedeemScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const ConfirmRedeemScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.landingScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const LandingScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.successScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const SuccessScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.doubleLunchScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const DoubleLunch(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.successfulLunchScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const SuccessfulLunchScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.redeemScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const RedeemScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.employeeScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const EmployeeScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.landingScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const LandingScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.copyShareLink,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child:  CopyShareLink(
         orgName: ''),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.orgNameScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: RegisterOrgNameScreen(
        ),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.authCompleteScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const AuthCompleteScreen(),
        key: state.pageKey,
      ),
    ),
  ],
);
