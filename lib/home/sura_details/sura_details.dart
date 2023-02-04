import 'package:flutter/material.dart';
import 'package:islami_own/home/sura_details/verse.dart';
import 'package:islami_own/my_theme.dart';
import 'package:islami_own/providers/my_provider.dart';
import 'package:islami_own/providers/sura_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'Sura_Details';

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    return ChangeNotifierProvider(
        create: (context) => SuraProvider()..loadFile(args.index),
        builder: (context, child) {
          var suraProvider = Provider.of<SuraProvider>(context);
          var myProvider = Provider.of<MyProvider>(context);
          return Stack(children: [
            Image.asset(
              myProvider.mode == ThemeMode.light
                  ? "assets/images/main_background.png"
                  : "assets/images/main_background_dark.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Scaffold(
              appBar: AppBar(
                title: Text(args.suraName,
                    style: Theme.of(context).textTheme.headline1),
              ),
              body: suraProvider.verses.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: myProvider.mode == ThemeMode.light
                              ? MyThemeData.colorWhite
                              : Theme.of(context).primaryColor,
                          border: Border.all(
                            color: MyThemeData.colorGold,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          )),
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: MyThemeData.colorGold,
                            indent: 30,
                            endIndent: 30,
                          );
                        },
                        itemBuilder: (context, index) {
                          return VerseItem(suraProvider.verses[index]);
                        },
                        itemCount: suraProvider.verses.length,
                      ),
                    ),
            )
          ]);
        });
  }
}

//data model / class
class SuraDetailsArgs {
  // data class  or model
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
