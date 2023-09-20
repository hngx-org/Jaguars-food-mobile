import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';
import 'common/constants/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      title: 'Jaguar Foods Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColor.appBrandColor,
          scaffoldBackgroundColor: AppColor.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showUnselectedLabels: true,
          ),
          appBarTheme: const AppBarTheme(elevation: 0)),
    );
  }
}


