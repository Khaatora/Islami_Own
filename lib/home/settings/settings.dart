import 'package:flutter/material.dart';
import 'package:islami_own/home/settings/language_bottom_sheet.dart';
import 'package:islami_own/my_theme.dart';
import 'package:islami_own/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'theme_mode_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language, style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: MyThemeData.colorGold,
          ),),
          const SizedBox(
            height: 10,

          ),
          InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(provider.langCode=="en"?"English":"عربي", style: Theme.of(context).textTheme.subtitle1,),
            ),
          ),
          const SizedBox(
            height: 20,

          ),
          Text(AppLocalizations.of(context)!.theme, style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: MyThemeData.colorGold,
          ),),
          const SizedBox(
            height: 10,

          ),
          InkWell(
            onTap: () {
              showThemeModeBottomSheet(context);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: MyThemeData.colorGold),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(provider.mode == ThemeMode.light?AppLocalizations.of(context)!.light: AppLocalizations.of(context)!.dark, style: Theme.of(context).textTheme.subtitle1,),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeModeBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return const ThemeModeBottomSheet();
    });
  }

  void showLanguageBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
      return const LangaugeBottomSheet();
    });
  }
}
