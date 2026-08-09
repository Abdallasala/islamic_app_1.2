import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/feature/onboarding%20screen/pages/on_boarding%20pages.dart';

import '../../../core/constant/local_storge_key.dart';
import '../../../core/services/local_storge_shared_perfence.dart';
import '../../layout/pages/layout.dart';

class SplashPage extends StatefulWidget {
  static String routename = 'splash';
  static Duration _duration = Duration(milliseconds: 1750);

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      var isFirstTime =
          LocalStorageServices.getbool(LocalStorgeKey.isFirstTime) ?? true;

      Navigator.pushReplacementNamed(
          context, isFirstTime ? Onboardingpages.routename : Layout.routename);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppPhoto.background_splash))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.height * .10),
              child: Align(
                  alignment: Alignment.topRight,
                  child: FadeInDown(
                    duration: SplashPage._duration,
                    child: Image.asset(
                      AppPhoto.lamba_splash,
                      height: size.height * .30,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .24),
              child: Align(
                alignment: Alignment.topLeft,
                child: FadeInLeft(
                  duration: SplashPage._duration,
                  child: Image.asset(
                    AppPhoto.left_splash,
                    height: size.height * .30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .40),
              child: Align(
                alignment: Alignment.centerRight,
                child: FadeInRight(
                  duration: SplashPage._duration,
                  child: Image.asset(
                    AppPhoto.right_splash,
                    height: size.height * .30,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ZoomIn(
                duration: SplashPage._duration,
                child: Image.asset(
                  AppPhoto.islami_splash,
                  height: size.height * .25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * .10),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(AppPhoto.mosque_splash)),
            ),
          ],
        ),
      ),
    );
  }
}
