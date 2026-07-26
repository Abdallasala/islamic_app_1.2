import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/core/theme/app_color.dart';

import '../../../core/model/surah_data.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  static String routename = 'qurandetails';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verselist = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)?.settings.arguments as Surah;
    if (verselist.isEmpty) loadData(args.number.toString());
    return SafeArea(
      child: Container(
        //  height: size.height,
        // width: size.width,
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppPhoto.sura_quran_details))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColor.primarycolor),
            title: Text(
              args.nameEn,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primarycolor),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                child: Text(
                  args.nameAr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primarycolor),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) => Text(
                    "${verselist[index]} [${index + 1}]",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primarycolor),
                  ),
                  itemCount: verselist.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadData(String surahid) async {
    String content =
        await rootBundle.loadString('assets/files/quran/$surahid.txt');
    setState(() {
      verselist = content.split('\n');
    });
    //print(content);
  }
}
