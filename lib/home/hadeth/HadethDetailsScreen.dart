import 'package:flutter/material.dart';
import 'package:islami_online_c4/home/hadeth/HadethTab.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)!.settings.arguments as HadethItem;
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
            args.title,
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
              borderRadius: BorderRadius.circular(24)),
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          child: SingleChildScrollView(
            child: Text(
              args.content,
              style: TextStyle(
                fontSize: 18,
                color: provider.isDarkMode()
                    ? MyThemeData.accentColorDark
                    : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
    ]);
  }
}
