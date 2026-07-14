import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';

class QuranTap extends StatelessWidget {
  const QuranTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppPhoto.quran_background))),
    );
  }
}
