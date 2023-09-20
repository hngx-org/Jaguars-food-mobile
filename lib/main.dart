import 'package:flutter/material.dart';
import 'package:jaguar_foods_mobile/common/constants/app_theme.dart';
import 'package:jaguar_foods_mobile/core/config/router_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: routerConfig,
        title: 'Jaguar Foods Mobile',
        debugShowCheckedModeBanner: false,
        theme: theme);
  }
}
