import 'package:flutter/material.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int Number_Tasbeh = 0;

  int index = 0;

  List<String> tasbeh_String = [
    'سبحان اللًه',
    'الحمدلله',
    ' لا اله الا اللًه',
    'اللًه اكبر',
  ];

  double rotateValue = 0.0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Image.asset(
                    provider.isDarkMode()
                        ? 'assets/images/head of seb7a.png'
                        : 'assets/images/headofseb7a.png',
                  )),
              Container(
                  margin: EdgeInsets.only(top: 78),
                  child: Transform.rotate(
                    angle: rotateValue,
                    child: ClipOval(
                        child: InkWell(
                            onTap: () => onPressed_tasbeh(),
                            borderRadius: BorderRadius.circular(120),
                            splashColor: Colors.transparent,
                            child: Image.asset(
                              provider.isDarkMode()
                                  ? 'assets/images/body of seb7a.png'
                                  : 'assets/images/bodyofseb7a.png',
                            ))),
                  ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'عدد التسبيحات ',
            style: TextStyle(
              fontSize: 25,
              color: provider.isDarkMode() ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyThemeData.primaryColorDark
                    : MyThemeData.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            child: Text(
              '$Number_Tasbeh',
              style: TextStyle(
                color: provider.isDarkMode() ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: provider.isDarkMode()
                    ? MyThemeData.accentColorDark
                    : MyThemeData.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(5),
            child: Text(
              '${tasbeh_String[index]}',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: provider.isDarkMode() ? Colors.black : Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void onPressed_tasbeh() {
    if (Number_Tasbeh <= 33) {
      Number_Tasbeh++;
    }
    if (Number_Tasbeh == 33 && index <= 3) {
      Number_Tasbeh = 0;
      index++;
    }
    if (index == 3) {
      index = 0;
    }
    rotateValue += 2;
    tasbeh_String[index];
    setState(() {});
  }
}
