import 'package:flutter/material.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class VerseWidget extends StatelessWidget {
  String text;
  int index;

  VerseWidget(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text + ' {${index + 1}}',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: provider.isDarkMode()
              ? MyThemeData.accentColorDark
              : Colors.black,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
