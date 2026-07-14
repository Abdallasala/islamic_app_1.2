import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/core/theme/app_color.dart';
import 'package:islamic_app_1/feature/layout/pages/hadith_tap.dart';
import 'package:islamic_app_1/feature/layout/pages/quran_tap.dart';
import 'package:islamic_app_1/feature/layout/pages/radio_tap.dart';
import 'package:islamic_app_1/feature/layout/pages/spha_tap.dart';
import 'package:islamic_app_1/feature/layout/pages/time_tap.dart';
import 'package:islamic_app_1/feature/layout/widgets/custom_nav_bar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  static String routename = '/layout';

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectindex = 0;
  List<Widget> taps = [
    QuranTap(),
    HadithTap(),
    Sabhatap(),
    RadioTap(),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectindex,
          onTap: (int index) {
            selectindex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: AppColor.white,
          backgroundColor: AppColor.primarycolor,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: CustomNavBar(
                  selecteditem: selectindex,
                  navbaritem: 0,
                  photopath: AppPhoto.quran_icon,
                ),
                label: 'Quran'),
            BottomNavigationBarItem(
                icon: CustomNavBar(
                  selecteditem: selectindex,
                  navbaritem: 1,
                  photopath: AppPhoto.hadath_icon,
                ),
                label: 'Hadith'),
            BottomNavigationBarItem(
                icon: CustomNavBar(
                  selecteditem: selectindex,
                  navbaritem: 2,
                  photopath: AppPhoto.sabha_icon,
                ),
                label: 'Sabha'),
            BottomNavigationBarItem(
                icon: CustomNavBar(
                  selecteditem: selectindex,
                  navbaritem: 3,
                  photopath: AppPhoto.radio_icon,
                ),
                label: 'Radio'),
            BottomNavigationBarItem(
                icon: CustomNavBar(
                  selecteditem: selectindex,
                  navbaritem: 4,
                  photopath: AppPhoto.time_icon,
                ),
                label: 'Time'),
          ]),
      body: taps[selectindex],
    );
  }
}
