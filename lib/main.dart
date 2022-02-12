import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_online_c4/home/HomeScreen.dart';
import 'package:islami_online_c4/home/hadeth/HadethDetailsScreen.dart';
import 'package:islami_online_c4/home/quran/SuraDetailsScreen.dart';
import 'package:islami_online_c4/providers/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return AppConfigProvider();
      },
      child: MainApplication()));
}

class MyThemeData {
  static const Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  static const Color primaryColorDark = Color.fromARGB(255, 20, 26, 46);
  static const Color accentColorDark = Color.fromARGB(255, 250, 204, 29);
  static final ThemeData lightTheme = ThemeData(
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black, fontSize: 24),
        headline3: TextStyle(color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: MyThemeData.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 30),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black, unselectedItemColor: Colors.white));
  static final ThemeData darkTheme = ThemeData(
      primaryTextTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white, fontSize: 24),
        headline3: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: MyThemeData.primaryColorDark,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: MyThemeData.accentColorDark,
          unselectedItemColor: Colors.white));
}

class MainApplication extends StatelessWidget {
  late AppConfigProvider provider;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    intiSharedpreference();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islami',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      routes: {
        HomeScreen.routeName: (buildContext) => HomeScreen(),
        HadethDetailsScreen.routeName: (buildContext) => HadethDetailsScreen(),
        SuraDetailsScreen.routeName: (buildContext) => SuraDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }

  void intiSharedpreference() async {
    prefs = await SharedPreferences.getInstance();
    provider.changeLanguage(prefs.getString('language') ?? 'en');
    if (prefs.getString('theme') == 'light') {
      provider.changeTheme(ThemeMode.light);
    } else if (prefs.getString('theme') == 'dark') {
      provider.changeTheme(ThemeMode.dark);
    }
  }
}
