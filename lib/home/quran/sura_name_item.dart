import 'package:flutter/material.dart';
import 'package:islami_own/home/sura_details/sura_details.dart';

class SuraNameItem extends StatelessWidget {
  String name;
  int index;

  SuraNameItem(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
        arguments: SuraDetailsArgs(name, index));
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
