import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_online_c4/home/quran/VerseWidget.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura-details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) readSura(args.index);
    return Stack(children: [
      Image.asset(
        provider.isDarkMode()
            ? 'assets/images/main_background_dark.png'
            : 'assets/images/main_background.png',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
          appBar: AppBar(
            title: Text(
              args.name,
              style: TextStyle(
                color: provider.isDarkMode()
                    ? MyThemeData.accentColorDark
                    : Colors.black,
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? MyThemeData.primaryColorDark
                  : Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            padding: EdgeInsets.all(8),
            child: ayat.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
              itemBuilder: (buildContext, index) {
                return VerseWidget(ayat[index], index);
              },
              itemCount: ayat.length,
              separatorBuilder: (buildContext, index) {
                return Container(
                  height: 1,
                  color: Theme.of(context).primaryColor,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                );
              },
            ),
          ))
    ]);
  }

  void readSura(int index) async {
    String fileName = 'assets/files/${index + 1}.txt';
    String fileContent = await rootBundle.loadString(fileName);
    // print(fileContent);
    List<String> verses = fileContent.split('\n');
    ayat = verses;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs(this.index, this.name);
}
