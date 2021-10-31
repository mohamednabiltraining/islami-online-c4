import 'package:flutter/material.dart';
import 'package:islami_online_c4/Hadeth/Hadeth.dart';
import 'package:islami_online_c4/Quran/Quran.dart';
import 'package:islami_online_c4/Radio/RadioTab.dart';
import 'package:islami_online_c4/sebha/Sebha.dart';

import 'main.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/bg3.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyThemeData.primaryColor,
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                currentPage = index;
                setState(() {});
              },
              currentIndex: currentPage,
              selectedItemColor: MyThemeData.selectedIconColor,
              unselectedItemColor: MyThemeData.unSelectedIconColor,
              items: [
                BottomNavigationBarItem(
                    label: 'radio',
                    icon: Image.asset('assets/images/ic_radio.png')),
                BottomNavigationBarItem(
                    label: 'sebha',
                    icon: Image.asset('assets/images/sebha.png')),
                BottomNavigationBarItem(
                    label: 'ahedeth',
                    icon: Image.asset(
                      'assets/images/quran-quran-svgrepo-com.png',
                      color: Colors.white,
                    )),
                BottomNavigationBarItem(
                    label: 'quran',
                    icon: Image.asset('assets/images/quran.png')),
              ],
            ),
          ),
          body: getCurrentPage(),
        ),
      ],
    );
  }

  Widget getCurrentPage() {
    if (currentPage == 0) return RadioTab();
    if (currentPage == 1) return Sebha();
    if (currentPage == 2)
      return Hadeth();
    else
      return Quran();
  }
}
