import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_online_c4/home/hadeth/HadethNameWidget.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (allHadethItems.isEmpty) loadHadethFile();
    return Column(
      children: [
        Expanded(
            flex: 1, child: Image.asset('assets/images/hadeth_top_logo.png')),
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
              AppLocalizations.of(context)!.hadethname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                color: provider.isDarkMode()
                    ? Colors.white
                    : Colors.black,
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
          child: allHadethItems.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
            itemBuilder: (buildContex, index) {
              return HadethNameWidget(allHadethItems[index]);
            },
            itemCount: allHadethItems.length,
            separatorBuilder: (buildContext, index) {
              return Container(
                color: Theme.of(context).primaryColor,
                height: 1,
                margin: EdgeInsets.symmetric(horizontal: 24),
              );
            },
          ),
        )
      ],
    );
  }

  List<HadethItem> allHadethItems = [];

  void loadHadethFile() async {
    List<HadethItem> allHadethData = [];
    String fileContent =
    await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadeth = fileContent.split('#\r\n');

    for (int i = 0; i < allAhadeth.length; i++) {
      List<String> singleHadethContent = allAhadeth[i].split('\n');
      if (singleHadethContent[0].isEmpty) singleHadethContent.removeAt(0);
      String title = singleHadethContent[0];
      String content = '';
      for (int j = 1; j < singleHadethContent.length; j++) {
        content += singleHadethContent[j] + ' ';
      }
      HadethItem item = HadethItem(title, content);
      allHadethData.add(item);
    }
    allHadethItems = allHadethData;
    setState(() {});
    //print(fileContent);
  }
}

class HadethItem {
  String title;
  String content;

  HadethItem(this.title, this.content);
}
