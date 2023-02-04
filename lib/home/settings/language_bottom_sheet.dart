import 'package:flutter/material.dart';
import 'package:islami_own/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/my_provider.dart';

class LangaugeBottomSheet extends StatelessWidget {
  const LangaugeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage('en');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: provider.langCode == 'en'?Theme.of(context).colorScheme.primary: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            child: Divider(color: MyThemeData.colorGold, thickness: 3,),
          ),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: provider.langCode == 'ar'?Theme.of(context).colorScheme.primary: Theme.of(context).colorScheme.secondary
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
