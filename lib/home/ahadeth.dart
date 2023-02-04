import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_own/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_own/providers/ahadeth_provider.dart';
import 'package:provider/provider.dart';
import 'hadeth_details/hadeth_details.dart';



class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (createContext) => AhadethProvider()..loadHadethFile(),
      builder: (contextBuilder, child) {
        var provider = Provider.of<AhadethProvider>(contextBuilder);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(child: Image.asset("assets/images/ahadeth_screen_img.png")),
            Divider(
              color: MyThemeData.colorGold,
              thickness: 3,
            ),
            Text(AppLocalizations.of(context)!.ahadeth,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center),
            Divider(
              color: MyThemeData.colorGold,
              thickness: 3,
            ),
            provider.Ahadeth.isEmpty
                ? CircularProgressIndicator()
                : Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: MyThemeData.colorGold,
                  thickness: 2,
                ),
                itemCount: provider.Ahadeth.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetails.routeName, arguments: provider.Ahadeth[index]);
                    },
                    child: Text(provider.Ahadeth[index].title, style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }


}

class HadethData {
  String title;
  List<String> content;
  HadethData(this.title, this.content);
}
