import 'package:flutter/material.dart';

import '../../../core/constant/app_photo_constant.dart';

class HadithTap extends StatelessWidget {
  const HadithTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppPhoto.hadath_background))),
    );
  }
}
