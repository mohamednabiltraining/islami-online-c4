import 'package:flutter/material.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_tab.png'),
          SizedBox(
            height: 40,
          ),
          Text(
            'اذاعة القرأن الكريم',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: provider.isDarkMode() ? Colors.white : Colors.black),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageIcon(
                AssetImage('assets/images/Icon metro-next.png'),
                color: provider.isDarkMode()
                    ? MyThemeData.accentColorDark
                    : MyThemeData.primaryColor,
              ),
              ImageIcon(
                AssetImage('assets/images/Icon awesome-play.png'),
                color: provider.isDarkMode()
                    ? MyThemeData.accentColorDark
                    : MyThemeData.primaryColor,
              ),
              ImageIcon(
                AssetImage('assets/images/Icon metro-next-1.png'),
                color: provider.isDarkMode()
                    ? MyThemeData.accentColorDark
                    : MyThemeData.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
