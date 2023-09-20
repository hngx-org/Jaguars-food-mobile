import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';
import 'common/constants/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(411.4, 868.6),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: routerConfig,
            title: 'Jaguar Foods Mobile',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: AppColor.appBrandColor,
                scaffoldBackgroundColor: AppColor.white,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                appBarTheme: const AppBarTheme(elevation: 0)),
          );
        });
  }
}
