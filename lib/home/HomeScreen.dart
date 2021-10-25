import 'package:flutter/material.dart';
import 'package:islami_online_c4/home/hadeth/HadethTab.dart';
import 'package:islami_online_c4/home/quran/QuranTab.dart';
import 'package:islami_online_c4/home/radio/RadioTab.dart';
import 'package:islami_online_c4/home/tasbeh/TasbehTab.dart';
import 'package:islami_online_c4/main.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/main_background.png'),
        Scaffold(
          appBar: AppBar(
            title: Text('islami'),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: MyThemeData.primaryColor),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_hadeth.png')),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_sebha.png')),
                    label: 'Tasbeh'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_radio.png')),
                    label: 'Radio'),
              ],
            ),
          ),
          body: Container(
            child: views[currentIndex],
          ),
        ),
      ],
    );
  }

  List<Widget> views = [QuranTab(), HadethTab(), TasbehTab(), RadioTab()];
}
