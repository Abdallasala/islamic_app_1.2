import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/core/model/recent_data.dart';
import 'package:islamic_app_1/core/theme/app_color.dart';

class RecentlyCardWidget extends StatelessWidget {
  RecentlyCardWidget({super.key, required this.recentData});

  final RecentData recentData;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // height: size.height*150/860,
      // width: size.width*285/862,
      margin: EdgeInsets.symmetric(horizontal: size.width * 10 / 862),
      padding: EdgeInsets.all(size.height * 10 / 862),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColor.primarycolor),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                recentData.suranameEn,
                style: TextStyle(
                    fontSize: size.height * 24 / 862,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                recentData.suranameAR,
                style: TextStyle(
                    fontSize: size.height * 24 / 862,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                recentData.suraVersanumber,
                style: TextStyle(
                    fontSize: size.height * 14 / 862,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Image.asset(AppPhoto.quran_most_recently)
        ],
      ),
    );
  }
}
