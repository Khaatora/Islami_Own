import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_own/home/ahadeth.dart';

class AhadethProvider extends ChangeNotifier{

  List<HadethData> Ahadeth = [];

  void loadHadethFile() async {
    String ahadethFile =
    await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> ahadeth = ahadethFile.trim().split("#\r\n");
    for (int i = 0; i < ahadeth.length; i++) {
      String hadeth = ahadeth[i];
      List<String> hadethLines = hadeth.split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethLines);
      Ahadeth.add(hadethData);
    }
  notifyListeners();
  }

}