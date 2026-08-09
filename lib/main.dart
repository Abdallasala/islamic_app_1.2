import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/services/local_storge_shared_perfence.dart';
import 'package:islamic_app_1/feature/layout/pages/layout.dart';
import 'package:islamic_app_1/feature/layout/quran/quran_details_screen.dart';
import 'package:islamic_app_1/feature/splash/pages/splash_page.dart';

import 'feature/onboarding screen/pages/on_boarding pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
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
        },
        Onboardingpages.routename: (_) {
          return Onboardingpages();
        },
        QuranDetailsScreen.routename: (_) {
          return QuranDetailsScreen();
        },
      },
    );
  }
}
