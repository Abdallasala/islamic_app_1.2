import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/core/model/surah_data.dart';
import 'package:islamic_app_1/core/theme/app_color.dart';

class Suracardwidget extends StatelessWidget {
  final Surah suradata;

  Suracardwidget({
    super.key,
    required this.suradata,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(AppPhoto.sura_quran_icon))),
          child: Text(
            suradata.number.toString(),
            style: TextStyle(
                fontSize: size.height * 14 / 862,
                fontWeight: FontWeight.bold,
                color: AppColor.titletextcolor),
          ),
        ),
        SizedBox(
          width: size.height * 20 / 862,
        ),
        Column(
          children: [
            Text(
              suradata.nameEn,
              style: TextStyle(
                fontSize: size.height * 20 / 862,
                fontWeight: FontWeight.bold,
                color: AppColor.titletextcolor,
              ),
            ),
            SizedBox(
              height: size.height * 10 / 862,
            ),
            Text(
              "${suradata.versesCount} verses",
              style: TextStyle(
                fontSize: size.height * 14 / 862,
                fontWeight: FontWeight.bold,
                color: AppColor.titletextcolor,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          suradata.nameAr,
          style: TextStyle(
            fontSize: size.height * 20 / 862,
            fontWeight: FontWeight.bold,
            color: AppColor.titletextcolor,
          ),
        ),
      ],
    );
  }
}
