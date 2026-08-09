import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/core/theme/app_color.dart';

import '../../../../core/model/hadith_data.dart';

class HadithItemCard extends StatelessWidget {
  final HadithData hadithData;

  HadithItemCard({super.key, required this.hadithData});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .15,
      margin: EdgeInsets.only(top: 10, bottom: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AppPhoto.hadith_layout_background)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  hadithData.hadithTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColor.scendrycolor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                hadithData.hadithText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColor.scendrycolor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
