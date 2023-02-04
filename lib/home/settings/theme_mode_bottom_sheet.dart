import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../my_theme.dart';
import '../../providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeModeBottomSheet extends StatelessWidget {
  const ThemeModeBottomSheet({Key? key}) : super(key: key);

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
            onTap: () {
              provider.changeThemeMode(ThemeMode.light);
            },
            child: themeItem(context, AppLocalizations.of(context)!.light, provider),
          ),
          SizedBox(
            height: 20,
            child: Divider(
              color: MyThemeData.colorGold,
              thickness: 3,
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeThemeMode(ThemeMode.dark);
            },
            child: themeItem(context, AppLocalizations.of(context)!.dark, provider),
          ),
        ],
      ),
    );
  }

  Widget themeItem(BuildContext context, String text, MyProvider provider) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                  color: text == 'Light' || text == "مضيء"
                      ? provider.mode == ThemeMode.light
                          ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary
                      : provider.mode != ThemeMode.light
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                ),
          )
        ],
      );
}
