import 'package:flutter/material.dart';
import 'package:islamic_app_1/core/constant/app_photo_constant.dart';
import 'package:islamic_app_1/core/constant/local_storge_key.dart';
import 'package:islamic_app_1/core/services/local_storge_shared_perfence.dart';
import 'package:islamic_app_1/core/theme/app_color.dart';
import 'package:islamic_app_1/feature/layout/quran/quran_details_screen.dart';
import 'package:islamic_app_1/feature/layout/quran/widgets/recently.dart';
import 'package:islamic_app_1/feature/layout/quran/widgets/suracardwidget.dart';

import '../../../core/model/surah_data.dart';

class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  String searchquery = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadrecentdata();
  }

  List<Surah> recentdatalist = [];
  List<Surah> searchlist = [];
  List<String> recentdataindex = [];

  final List<Surah> surahs = [
    Surah(number: 1, nameAr: "الفاتحة", nameEn: "Al-Fatihah", versesCount: 7),
    Surah(number: 2, nameAr: "البقرة", nameEn: "Al-Baqarah", versesCount: 286),
    Surah(
        number: 3, nameAr: "آل عمران", nameEn: "Ali 'Imran", versesCount: 200),
    Surah(number: 4, nameAr: "النساء", nameEn: "An-Nisa", versesCount: 176),
    Surah(number: 5, nameAr: "المائدة", nameEn: "Al-Ma'idah", versesCount: 120),
    Surah(number: 6, nameAr: "الأنعام", nameEn: "Al-An'am", versesCount: 165),
    Surah(number: 7, nameAr: "الأعراف", nameEn: "Al-A'raf", versesCount: 206),
    Surah(number: 8, nameAr: "الأنفال", nameEn: "Al-Anfal", versesCount: 75),
    Surah(number: 9, nameAr: "التوبة", nameEn: "At-Tawbah", versesCount: 129),
    Surah(number: 10, nameAr: "يونس", nameEn: "Yunus", versesCount: 109),
    Surah(number: 11, nameAr: "هود", nameEn: "Hud", versesCount: 123),
    Surah(number: 12, nameAr: "يوسف", nameEn: "Yusuf", versesCount: 111),
    Surah(number: 13, nameAr: "الرعد", nameEn: "Ar-Ra'd", versesCount: 43),
    Surah(number: 14, nameAr: "إبراهيم", nameEn: "Ibrahim", versesCount: 52),
    Surah(number: 15, nameAr: "الحجر", nameEn: "Al-Hijr", versesCount: 99),
    Surah(number: 16, nameAr: "النحل", nameEn: "An-Nahl", versesCount: 128),
    Surah(number: 17, nameAr: "الإسراء", nameEn: "Al-Isra", versesCount: 111),
    Surah(number: 18, nameAr: "الكهف", nameEn: "Al-Kahf", versesCount: 110),
    Surah(number: 19, nameAr: "مريم", nameEn: "Maryam", versesCount: 98),
    Surah(number: 20, nameAr: "طه", nameEn: "Ta-Ha", versesCount: 135),
    Surah(
        number: 21, nameAr: "الأنبياء", nameEn: "Al-Anbiya", versesCount: 112),
    Surah(number: 22, nameAr: "الحج", nameEn: "Al-Hajj", versesCount: 78),
    Surah(
        number: 23,
        nameAr: "المؤمنون",
        nameEn: "Al-Mu'minun",
        versesCount: 118),
    Surah(number: 24, nameAr: "النور", nameEn: "An-Nur", versesCount: 64),
    Surah(number: 25, nameAr: "الفرقان", nameEn: "Al-Furqan", versesCount: 77),
    Surah(
        number: 26, nameAr: "الشعراء", nameEn: "Ash-Shu'ara", versesCount: 227),
    Surah(number: 27, nameAr: "النمل", nameEn: "An-Naml", versesCount: 93),
    Surah(number: 28, nameAr: "القصص", nameEn: "Al-Qasas", versesCount: 88),
    Surah(
        number: 29, nameAr: "العنكبوت", nameEn: "Al-'Ankabut", versesCount: 69),
    Surah(number: 30, nameAr: "الروم", nameEn: "Ar-Rum", versesCount: 60),
    Surah(number: 31, nameAr: "لقمان", nameEn: "Luqman", versesCount: 34),
    Surah(number: 32, nameAr: "السجدة", nameEn: "As-Sajdah", versesCount: 30),
    Surah(number: 33, nameAr: "الأحزاب", nameEn: "Al-Ahzab", versesCount: 73),
    Surah(number: 34, nameAr: "سبأ", nameEn: "Saba", versesCount: 54),
    Surah(number: 35, nameAr: "فاطر", nameEn: "Fatir", versesCount: 45),
    Surah(number: 36, nameAr: "يس", nameEn: "Ya-Sin", versesCount: 83),
    Surah(number: 37, nameAr: "الصافات", nameEn: "As-Saffat", versesCount: 182),
    Surah(number: 38, nameAr: "ص", nameEn: "Sad", versesCount: 88),
    Surah(number: 39, nameAr: "الزمر", nameEn: "Az-Zumar", versesCount: 75),
    Surah(number: 40, nameAr: "غافر", nameEn: "Ghafir", versesCount: 85),
    Surah(number: 41, nameAr: "فصلت", nameEn: "Fussilat", versesCount: 54),
    Surah(number: 42, nameAr: "الشورى", nameEn: "Ash-Shura", versesCount: 53),
    Surah(number: 43, nameAr: "الزخرف", nameEn: "Az-Zukhruf", versesCount: 89),
    Surah(number: 44, nameAr: "الدخان", nameEn: "Ad-Dukhan", versesCount: 59),
    Surah(
        number: 45, nameAr: "الجاثية", nameEn: "Al-Jathiyah", versesCount: 37),
    Surah(number: 46, nameAr: "الأحقاف", nameEn: "Al-Ahqaf", versesCount: 35),
    Surah(number: 47, nameAr: "محمد", nameEn: "Muhammad", versesCount: 38),
    Surah(number: 48, nameAr: "الفتح", nameEn: "Al-Fath", versesCount: 29),
    Surah(number: 49, nameAr: "الحجرات", nameEn: "Al-Hujurat", versesCount: 18),
    Surah(number: 50, nameAr: "ق", nameEn: "Qaf", versesCount: 45),
    Surah(
        number: 51,
        nameAr: "الذاريات",
        nameEn: "Adh-Dhariyat",
        versesCount: 60),
    Surah(number: 52, nameAr: "الطور", nameEn: "At-Tur", versesCount: 49),
    Surah(number: 53, nameAr: "النجم", nameEn: "An-Najm", versesCount: 62),
    Surah(number: 54, nameAr: "القمر", nameEn: "Al-Qamar", versesCount: 55),
    Surah(number: 55, nameAr: "الرحمن", nameEn: "Ar-Rahman", versesCount: 78),
    Surah(number: 56, nameAr: "الواقعة", nameEn: "Al-Waqi'ah", versesCount: 96),
    Surah(number: 57, nameAr: "الحديد", nameEn: "Al-Hadid", versesCount: 29),
    Surah(
        number: 58,
        nameAr: "المجادلة",
        nameEn: "Al-Mujadilah",
        versesCount: 22),
    Surah(number: 59, nameAr: "الحشر", nameEn: "Al-Hashr", versesCount: 24),
    Surah(
        number: 60,
        nameAr: "الممتحنة",
        nameEn: "Al-Mumtahanah",
        versesCount: 13),
    Surah(number: 61, nameAr: "الصف", nameEn: "As-Saff", versesCount: 14),
    Surah(number: 62, nameAr: "الجمعة", nameEn: "Al-Jumu'ah", versesCount: 11),
    Surah(
        number: 63,
        nameAr: "المنافقون",
        nameEn: "Al-Munafiqun",
        versesCount: 11),
    Surah(
        number: 64, nameAr: "التغابن", nameEn: "At-Taghabun", versesCount: 18),
    Surah(number: 65, nameAr: "الطلاق", nameEn: "At-Talaq", versesCount: 12),
    Surah(number: 66, nameAr: "التحريم", nameEn: "At-Tahrim", versesCount: 12),
    Surah(number: 67, nameAr: "الملك", nameEn: "Al-Mulk", versesCount: 30),
    Surah(number: 68, nameAr: "القلم", nameEn: "Al-Qalam", versesCount: 52),
    Surah(number: 69, nameAr: "الحاقة", nameEn: "Al-Haqqah", versesCount: 52),
    Surah(number: 70, nameAr: "المعارج", nameEn: "Al-Ma'arij", versesCount: 44),
    Surah(number: 71, nameAr: "نوح", nameEn: "Nuh", versesCount: 28),
    Surah(number: 72, nameAr: "الجن", nameEn: "Al-Jinn", versesCount: 28),
    Surah(
        number: 73, nameAr: "المزمل", nameEn: "Al-Muzzammil", versesCount: 20),
    Surah(
        number: 74,
        nameAr: "المدثر",
        nameEn: "Al-Muddaththir",
        versesCount: 56),
    Surah(number: 75, nameAr: "القيامة", nameEn: "Al-Qiyamah", versesCount: 40),
    Surah(number: 76, nameAr: "الإنسان", nameEn: "Al-Insan", versesCount: 31),
    Surah(
        number: 77, nameAr: "المرسلات", nameEn: "Al-Mursalat", versesCount: 50),
    Surah(number: 78, nameAr: "النبأ", nameEn: "An-Naba", versesCount: 40),
    Surah(
        number: 79, nameAr: "النازعات", nameEn: "An-Nazi'at", versesCount: 46),
    Surah(number: 80, nameAr: "عبس", nameEn: "'Abasa", versesCount: 42),
    Surah(number: 81, nameAr: "التكوير", nameEn: "At-Takwir", versesCount: 29),
    Surah(
        number: 82, nameAr: "الانفطار", nameEn: "Al-Infitar", versesCount: 19),
    Surah(
        number: 83,
        nameAr: "المطففين",
        nameEn: "Al-Mutaffifin",
        versesCount: 36),
    Surah(
        number: 84, nameAr: "الانشقاق", nameEn: "Al-Inshiqaq", versesCount: 25),
    Surah(number: 85, nameAr: "البروج", nameEn: "Al-Buruj", versesCount: 22),
    Surah(number: 86, nameAr: "الطارق", nameEn: "At-Tariq", versesCount: 17),
    Surah(number: 87, nameAr: "الأعلى", nameEn: "Al-A'la", versesCount: 19),
    Surah(
        number: 88, nameAr: "الغاشية", nameEn: "Al-Ghashiyah", versesCount: 26),
    Surah(number: 89, nameAr: "الفجر", nameEn: "Al-Fajr", versesCount: 30),
    Surah(number: 90, nameAr: "البلد", nameEn: "Al-Balad", versesCount: 20),
    Surah(number: 91, nameAr: "الشمس", nameEn: "Ash-Shams", versesCount: 15),
    Surah(number: 92, nameAr: "الليل", nameEn: "Al-Layl", versesCount: 21),
    Surah(number: 93, nameAr: "الضحى", nameEn: "Ad-Duha", versesCount: 11),
    Surah(number: 94, nameAr: "الشرح", nameEn: "Ash-Sharh", versesCount: 8),
    Surah(number: 95, nameAr: "التين", nameEn: "At-Tin", versesCount: 8),
    Surah(number: 96, nameAr: "العلق", nameEn: "Al-'Alaq", versesCount: 19),
    Surah(number: 97, nameAr: "القدر", nameEn: "Al-Qadr", versesCount: 5),
    Surah(number: 98, nameAr: "البينة", nameEn: "Al-Bayyinah", versesCount: 8),
    Surah(number: 99, nameAr: "الزلزلة", nameEn: "Az-Zalzalah", versesCount: 8),
    Surah(
        number: 100, nameAr: "العاديات", nameEn: "Al-'Adiyat", versesCount: 11),
    Surah(
        number: 101, nameAr: "القارعة", nameEn: "Al-Qari'ah", versesCount: 11),
    Surah(
        number: 102, nameAr: "التكاثر", nameEn: "At-Takathur", versesCount: 8),
    Surah(number: 103, nameAr: "العصر", nameEn: "Al-'Asr", versesCount: 3),
    Surah(number: 104, nameAr: "الهمزة", nameEn: "Al-Humazah", versesCount: 9),
    Surah(number: 105, nameAr: "الفيل", nameEn: "Al-Fil", versesCount: 5),
    Surah(number: 106, nameAr: "قريش", nameEn: "Quraysh", versesCount: 4),
    Surah(number: 107, nameAr: "الماعون", nameEn: "Al-Ma'un", versesCount: 7),
    Surah(number: 108, nameAr: "الكوثر", nameEn: "Al-Kawthar", versesCount: 3),
    Surah(
        number: 109, nameAr: "الكافرون", nameEn: "Al-Kafirun", versesCount: 6),
    Surah(number: 110, nameAr: "النصر", nameEn: "An-Nasr", versesCount: 3),
    Surah(number: 111, nameAr: "المسد", nameEn: "Al-Masad", versesCount: 5),
    Surah(number: 112, nameAr: "الإخلاص", nameEn: "Al-Ikhlas", versesCount: 4),
    Surah(number: 113, nameAr: "الفلق", nameEn: "Al-Falaq", versesCount: 5),
    Surah(number: 114, nameAr: "الناس", nameEn: "An-Nas", versesCount: 6),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppPhoto.quran_background))),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppPhoto.islami_logo1,
                height: size.height * .15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (String value) {
                    searchquery = value;
                    search();
                    setState(() {});
                  },
                  onFieldSubmitted: (String value) {
                    searchquery = value;
                    setState(() {});
                  },
                  cursorColor: AppColor.primarycolor,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.titletextcolor),
                  decoration: InputDecoration(
                    prefixIcon: ImageIcon(
                      AssetImage(AppPhoto.quran_icon1),
                      color: AppColor.primarycolor,
                    ),
                    hintText: "sura Name",
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.titletextcolor),
                    fillColor: AppColor.scendrycolor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: AppColor.primarycolor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: AppColor.primarycolor)),
                  ),
                ),
              ),
              Visibility(
                visible: searchquery.isEmpty,
                replacement: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _onsuratap(searchlist[index].number - 1),
                    child: Suracardwidget(
                      suradata: searchlist[index],
                    ),
                  ),
                  separatorBuilder: (context, int index) => Divider(
                    endIndent: 60,
                    indent: 60,
                  ),
                  itemCount: searchlist.length,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text(
                        'Most Recently ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 155 / 862,
                      child: Visibility(
                        visible: recentdatalist.isNotEmpty,
                        replacement: Text(
                          'No Recent data',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.titletextcolor),
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 20 / 862),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  arguments: recentdatalist[index],
                                  context,
                                  QuranDetailsScreen.routename);
                            },
                            child: RecentlyCardWidget(
                              recentData: recentdatalist[index],
                            ),
                          ),
                          itemCount: recentdatalist.length,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      child: Text(
                        'sura List ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => _onsuratap(surahs[index].number - 1),
                          child: Suracardwidget(
                            suradata: surahs[index],
                          ),
                        ),
                        separatorBuilder: (context, int index) => Divider(
                          endIndent: 60,
                          indent: 60,
                        ),
                        itemCount: surahs.length,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onsuratap(int index) {
    _cachesuratap(index);
    Navigator.of(context).pushNamed(
      QuranDetailsScreen.routename,
      arguments: surahs[index],
    );
  }

  _cachesuratap(int index) async {
    var indexString = index.toString();
    if (recentdataindex.contains(indexString)) return;
    if (recentdatalist.length == 5) {
      recentdatalist.removeLast();
    }
    recentdataindex.insert(0, indexString);
    await LocalStorageServices.setListString(
        LocalStorgeKey.recentsura, recentdatalist.cast<String>());
    _loadrecentdata();
    setState(() {});
  }

  _loadrecentdata() {
    LocalStorageServices.remove(LocalStorgeKey.recentsura);
    recentdataindex = [];
    recentdatalist = [];
    recentdataindex =
        LocalStorageServices.getListString(LocalStorgeKey.recentsura) ?? [];
    for (var index in recentdataindex) {
      var indexInt = int.parse(index);
      recentdatalist.add(surahs[indexInt]);
    }
  }

  void search() {
    for (var sura in surahs) {
      if (sura.nameAr.toLowerCase().contains(searchquery) ||
          sura.nameEn.toLowerCase().contains(searchquery)) {
        searchlist.add(sura);
      }
    }
  }
}
