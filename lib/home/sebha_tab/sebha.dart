import 'package:flutter/material.dart';
import 'package:islami_own/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<String> tasbeehat = [
  "سبحان الله",
  "الحمد لله",
  "الله أكبر",
  "لا اله ألا الله",
  "أستغفر الله"
];

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();

}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  String dropdownValue = tasbeehat.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              tasbeeha();
            },
            child: Image.asset(
              "assets/images/sebha_screen_img.png",
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: Text(
                AppLocalizations.of(context)!.numberOfTasbeih,
                style: Theme.of(context).textTheme.headline1,
              )),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(183, 147, 95, .57),
                borderRadius: BorderRadius.circular(25)),
            child:
                Text("$counter", style: Theme.of(context).textTheme.subtitle1),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: MyThemeData.colorGold,
                  ),
              child: DropdownButton<String>(
                dropdownColor: MyThemeData.colorGold,
                alignment: Alignment.center,
                value: dropdownValue,
                elevation: 0,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,color: Colors.white ),
                icon: const Icon(Icons.arrow_downward),
                onChanged: (String? value){
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: tasbeehat.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(value: item, child: Text(item,
                  ));
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  void tasbeeha() {
    counter++;
    if (counter == 34) {
      counter = 0;
      if (index == tasbeehat.length - 1) {
        index = 0;
      } else {
        index++;
      }
    }
    dropdownValue = tasbeehat[index];
    setState(() {});
  }
}
