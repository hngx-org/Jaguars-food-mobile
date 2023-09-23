import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:jaguar_foods_mobile/3_presentation/auth_complete_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/double_lunch/double_lunch.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/join_organization.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/send_lunch_deal/send_lunch_deal.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/landing_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/org_name_register.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/redeem_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/set_lunch_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/employee_screen/employee_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/home/home_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/screens/nav_screen/nav_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/verification_screen.dart';
import 'package:jaguar_foods_mobile/3_presentation/withdraw_details/withdraw_details.dart';
import 'package:jaguar_foods_mobile/common/constants/route_constant.dart';
import 'package:jaguar_foods_mobile/3_presentation/onboarding/screens/screens_barrel.dart';
import '../../3_presentation/confirm_redeem_screen.dart';
import '../../3_presentation/success_screen.dart';
import '../../3_presentation/onboarding/screens/share_invite_screen.dart';
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
        pageBuilder: (context, state) {
          if (state.extra != null) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return CupertinoPage<void>(
              child: SendLunchDealScreen(
                giftee: args['giftee'],
              ),
              key: state.pageKey,
            );
          } else {
            return CupertinoPage<void>(
              child: const SendLunchDealScreen(
                giftee: '',
              ),
              key: state.pageKey,
            );
          }
        }),
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
        pageBuilder: (context, state) {
          if (state.extra != null) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return CupertinoPage<void>(
              child: NavigationScreen(
                initialIndex: args["id"],
              ),
              key: state.pageKey,
            );
          } else {
            return CupertinoPage<void>(
              child: const NavigationScreen(
                initialIndex: 0,
              ),
              key: state.pageKey,
            );
          }
        }),
    GoRoute(
      path: RoutesPath.confirmRedeemScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const ConfirmRedeemScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.withdrawDetailsScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const WithdrawDetailsScreen(),
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
      pageBuilder: (context, state) {
        if (state.extra != null) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return CupertinoPage<void>(
            child: SuccessScreen(
              giftee: args['giftee'],
              lunchType: args['lunch'],
            ),
            key: state.pageKey,
          );
        } else {
          return CupertinoPage<void>(
            child: const SuccessScreen(),
            key: state.pageKey,
          );
        }
      },
    ),
    GoRoute(
        path: RoutesPath.doubleLunchScreen,
        pageBuilder: (context, state) {
          if (state.extra != null) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return CupertinoPage<void>(
              child: DoubleLunch(
                giftee: args['giftee'],
                lunchType: args['lunch'],
              ),
              key: state.pageKey,
            );
          } else {
            return CupertinoPage<void>(
              child: const DoubleLunch(
                lunchType: '',
              ),
              key: state.pageKey,
            );
          }
        }),
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
      path: RoutesPath.createOrganizationScreen,
      pageBuilder: (context, state) {
        if (state.extra != null) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return CupertinoPage<void>(
            child: CreateOrganizationScreen(
              orgName: args['companyName'],
            ),
            key: state.pageKey,
          );
        } else {
          return CupertinoPage<void>(
            child: const CreateOrganizationScreen(
              orgName: '',
            ),
            key: state.pageKey,
          );
        }
      },
    ),
    GoRoute(
      path: RoutesPath.shareInviteScreen,
      pageBuilder: (context, state) {
        if (state.extra != null) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return CupertinoPage<void>(
            child: ShareInviteScreen(
              orgName: args['companyName'],
              token: args['token'],
            ),
            key: state.pageKey,
          );
        } else {
          return CupertinoPage<void>(
            child: const ShareInviteScreen(
              orgName: '',
              token: '',
            ),
            key: state.pageKey,
          );
        }
      },
    ),
    GoRoute(
      path: RoutesPath.landingScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const LandingScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
      path: RoutesPath.orgNameScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const RegisterOrgNameScreen(),
        key: state.pageKey,
      ),
    ),
    GoRoute(
        path: RoutesPath.verificationScreen,
        pageBuilder: (context, state) {
          if (state.extra != null) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return CupertinoPage<void>(
              child: VerificationScreen(
                orgName: args['companyName'],
              ),
              key: state.pageKey,
            );
          } else {
            return CupertinoPage<void>(
              child: const VerificationScreen(
                orgName: '',
              ),
              key: state.pageKey,
            );
          }
        }),
    GoRoute(
        path: RoutesPath.authCompleteScreen,
        pageBuilder: (context, state) {
          if (state.extra != null) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return CupertinoPage<void>(
              child: AuthCompleteScreen(
                orgName: args['companyName'],
                token: args['token'],
              ),
              key: state.pageKey,
            );
          } else {
            return CupertinoPage<void>(
              child: const AuthCompleteScreen(
                orgName: '',
                token: '',
              ),
              key: state.pageKey,
            );
          }
        }),
    GoRoute(
        path: RoutesPath.setLunchPriceScreen,
        pageBuilder: (context, state) {
          if (state.extra != null) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return CupertinoPage<void>(
              child: SetLunchPriceScreen(
                orgName: args['companyName'],
                email: args['email'],
                firstName: args['first_name'],
                lastName: args['last_name'],
                phoneNumber: args['phone_number'],
                password: args['password'],
              ),
              key: state.pageKey,
            );
          } else {
            return CupertinoPage<void>(
              child: const SetLunchPriceScreen(
                orgName: '',
                email: '',
                firstName: '',
                lastName: '',
                phoneNumber: '',
                password: '',
              ),
              key: state.pageKey,
            );
          }
        }),
    GoRoute(
      path: RoutesPath.joinOrganizationScreen,
      pageBuilder: (context, state) => CupertinoPage<void>(
        child: const JoinOrganizationScreen(),
        key: state.pageKey,
      ),
    ),
  ],
);
