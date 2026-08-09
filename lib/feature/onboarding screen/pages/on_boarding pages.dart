import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/core/constant/local_storge_key.dart';
import 'package:islamic_app_1/core/services/local_storge_shared_perfence.dart';
import 'package:islamic_app_1/feature/layout/pages/layout.dart';
import 'package:islamic_app_1/feature/onboarding%20screen/widgets/bording%20item.dart';

import '../../../core/model/on_borading_model.dart';
import '../../../core/theme/app_color.dart';

class Onboardingpages extends StatefulWidget {
  Onboardingpages({super.key});

  static String routename = '/onboardingpages';

  @override
  State<Onboardingpages> createState() => _OnboardingpagesState();
}

class _OnboardingpagesState extends State<Onboardingpages> {
  final controller = PageController();
  int currentindex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalStorageServices.setbool(LocalStorgeKey.isFirstTime, false);
  }

  List<BoardingModel> boarding = [
    BoardingModel(
      image: AppPhoto.welcome_onboard,
      title: "Welcome To Islmi App",
      body: "",
    ),
    BoardingModel(
      image: AppPhoto.kabb2,
      title: "Mosque",
      body: "We Are Very Excited To Have You In Our Community",
    ),
    BoardingModel(
      image: AppPhoto.picture3_in_onboarding,
      title: "Reading the Quran",
      body: "Read, and your Lord is the Most Generous",
    ),
    BoardingModel(
      image: AppPhoto.picture4_in_onboarding,
      title: "Bearish",
      body: "Praise the name of your Lord, the Most High",
    ),
    BoardingModel(
      image: AppPhoto.picture5_in_onboarding,
      title: "Holy Quran Radio",
      body:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppPhoto.mosque_splash,
                height: size.height * .25,
              )),
          Padding(
            padding: EdgeInsets.only(top: size.height * .10),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppPhoto.islami,
                height: size.height * (96 / 932),
                width: size.width * (166 / 430),
              ),
            ),
          ),
          PageView.builder(
            controller: controller,
            onPageChanged: (int index) {
              setState(() {
                currentindex = index;
              });
            },
            itemCount: boarding.length,
            itemBuilder: (context, index) {
              final page = boarding[index];
              return Boradingitem(
                title: page.title,
                subtitle: page.body,
                image: page.image,
              );
            },
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentindex > 0)
                  TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(color: AppColor.primarycolor),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          boarding.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: currentindex == index
                                  ? AppColor.primarycolor
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (currentindex < boarding.length - 1)
                  TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: AppColor.primarycolor),
                    ),
                  ),
                if (currentindex == boarding.length - 1)
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Layout.routename);
                    },
                    child: Text(
                      "Finish",
                      style: TextStyle(color: AppColor.primarycolor),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
