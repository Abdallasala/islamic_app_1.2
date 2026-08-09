import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app_1/feature/layout/hadiath/widgets/hadith_item_card.dart';

import '../../../core/constant/app_photo_constant.dart';
import '../../../core/model/hadith_data.dart';

class HadithTap extends StatefulWidget {
  HadithTap({super.key});

  @override
  State<HadithTap> createState() => _HadithTapState();
}

class _HadithTapState extends State<HadithTap> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (hadithList.isEmpty) _loadHadithFromAssets();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppPhoto.logo_hadith_islami))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppPhoto.islami_logo1,
            height: size.height * .15,
          ),
          CarouselSlider(
              items: hadithList
                  .map(
                    (e) => HadithItemCard(hadithData: e),
                  )
                  .toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.62,
                //  height: 400,
                aspectRatio: 0.7,
                viewportFraction: 0.68,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ))
        ],
      ),
    );
  }

  List hadithList = [];

  Future<void> _loadHadithFromAssets() async {
    for (int i = 1; i <= 50; i++) {
      String hadithText = await rootBundle.loadString(
        "assets/files/hadith/h$i.txt",
      );
      print(hadithText);

      int titleLength = hadithText.trim().indexOf("\n");

      String hadithTitle = hadithText.substring(0, titleLength);
      String hadithBody = hadithText.substring(titleLength + 1);

      HadithData hadithData = HadithData(
        hadithTitle: hadithTitle,
        hadithText: hadithBody,
      );

      hadithList.add(hadithData);

      setState(() {});
    }
  }
}
