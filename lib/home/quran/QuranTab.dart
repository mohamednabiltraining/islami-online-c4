import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_online_c4/home/quran/SuraNameWidget.dart';
import 'package:islami_online_c4/main.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  List<String> names = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/quran_top_logo.png'),
            ],
          ),
        ),
        Column(
          children: [
            Divider(
              height: 1,
              color: provider.isDarkMode()
                  ? MyThemeData.accentColorDark
                  : MyThemeData.primaryColor,
              thickness: 1,
            ),
            Text(
              AppLocalizations.of(context)!.suraname,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: provider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
            Divider(
              height: 1,
              color: provider.isDarkMode()
                  ? MyThemeData.accentColorDark
                  : MyThemeData.primaryColor,
              thickness: 1,
            ),
          ],
        ),
        Expanded(
          flex: 3,
          child: ListView.separated(
            itemBuilder: (buildContext, index) {
              return SuraNameWidget(index, names[index]);
            },
            itemCount: names.length,
            separatorBuilder: (buildContext, index) {
              return Container(
                height: 1,
                color: provider.isDarkMode()
                    ? MyThemeData.accentColorDark
                    : MyThemeData.primaryColor,
                margin: EdgeInsets.symmetric(horizontal: 24),
              );
            },
          ),
        )
      ],
    );
  }
}
