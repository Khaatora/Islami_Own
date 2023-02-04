import 'package:flutter/material.dart';
import 'package:islami_own/home/ahadeth.dart';
import 'package:islami_own/home/quran.dart';
import 'package:islami_own/home/radio/radio.dart';
import 'package:islami_own/home/sebha_tab/sebha.dart';
import 'package:islami_own/home/settings/settings.dart';
import 'package:islami_own/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home_Screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.getBackgroundImage(),
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle,
                style: Theme.of(context).textTheme.headline1),
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: provider.mode == ThemeMode.light?MyThemeData.colorGold: MyThemeData.colorDarkBlue,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    size: 30,
                    AssetImage("assets/images/quran.png"),
                  ),
                  label: AppLocalizations.of(context)!.quran,
                  backgroundColor: provider.mode == ThemeMode.light?MyThemeData.colorGold: MyThemeData.colorYellow,),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    size: 30,
                    AssetImage("assets/images/sebha.png"),
                  ),
                  label: AppLocalizations.of(context)!.sebha,
                  backgroundColor: provider.mode == ThemeMode.light?MyThemeData.colorGold: MyThemeData.colorYellow,),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    size: 30,
                    AssetImage("assets/images/radio.png"),
                  ),
                  label: AppLocalizations.of(context)!.radio,
                  backgroundColor: provider.mode == ThemeMode.light?MyThemeData.colorGold: MyThemeData.colorYellow,),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    size: 30,
                    AssetImage("assets/images/ahadeth.png"),
                  ),
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: provider.mode == ThemeMode.light?MyThemeData.colorGold: MyThemeData.colorYellow,),
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  label: AppLocalizations.of(context)!.settings,
                  backgroundColor: provider.mode == ThemeMode.light?MyThemeData.colorGold: MyThemeData.colorYellow,),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    const SettingsTab(),
  ];
}
