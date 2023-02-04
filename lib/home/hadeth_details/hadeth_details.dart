import 'package:flutter/material.dart';
import 'package:islami_own/home/ahadeth.dart';
import 'package:islami_own/my_theme.dart';
import 'package:islami_own/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "Hadeth_Details_Tab";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethData;
    var myProvider = Provider.of<MyProvider>(context);
    return Stack(children: [
      Image.asset(
        myProvider.getBackgroundImage(),
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(args.title, style: Theme.of(context).textTheme.subtitle1),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
              vertical: MediaQuery.of(context).size.height * 0.01),
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
            ),
          ),
          child: ListView.builder(
            itemCount: args.content.length,
            itemBuilder: (context, index) {
              return Text(
                args.content[index],
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      )
    ]);
  }
}
