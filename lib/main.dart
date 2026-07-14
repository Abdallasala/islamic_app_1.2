import 'package:flutter/material.dart';
import 'package:islamic_app_1/feature/layout/pages/layout.dart';
import 'package:islamic_app_1/feature/splash/pages/splash_page.dart';

void main() {
  runApp(const IslamicApp());
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routename,
      routes: {
        SplashPage.routename: (_) {
          return SplashPage();
        },
        Layout.routename: (_) {
          return Layout();
        }
      },
    );
  }
}
