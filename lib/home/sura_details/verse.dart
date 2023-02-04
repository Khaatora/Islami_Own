import 'package:flutter/material.dart';

class VerseItem extends StatelessWidget {


  String aya;

  VerseItem(this.aya);

  @override
  Widget build(BuildContext context) {
    return Text(aya, style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center,);

}
}
