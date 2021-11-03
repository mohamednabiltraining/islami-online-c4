import 'package:flutter/material.dart';

import '../../main.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageIcon(
                AssetImage('assets/images/Icon metro-next.png'),
                color: MyThemeData.primaryColor,
              ),
              ImageIcon(
                AssetImage('assets/images/Icon awesome-play.png'),
                color: MyThemeData.primaryColor,
              ),
              ImageIcon(
                AssetImage('assets/images/Icon metro-next-1.png'),
                color: MyThemeData.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
