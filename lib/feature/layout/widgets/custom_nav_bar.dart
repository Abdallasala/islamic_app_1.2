import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/theme/app_color.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar(
      {super.key,
      required this.selecteditem,
      required this.navbaritem,
      required this.photopath});

  final int selecteditem;

  final int navbaritem;

  final String photopath;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: selecteditem == navbaritem
                ? AppColor.scendrycolor.withOpacity(.5)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25)),
        child: ImageIcon(AssetImage(photopath)));
  }
}
