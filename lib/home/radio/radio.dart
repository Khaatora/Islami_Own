import 'package:flutter/material.dart';
import 'package:islami_own/home/radio/radio_item.dart';
import 'package:islami_own/models/radio_response.dart';
import 'package:islami_own/network/remote/api_manager.dart';
import 'package:islami_own/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RadioTab extends StatelessWidget {
  final ItemScrollController itemScrollController = ItemScrollController();

  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    MyProvider provider = Provider.of(context);
    return FutureBuilder<RadioResponse>(
        future: ApiManager.getRadios(provider.langCode),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return (Center(
              child: Text("${snapshot.error ?? "Something Went Wrong"}"),
            ));
          }
          var radios = snapshot.data!.radios!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.asset("assets/images/radio_screen_img.png")),
              Expanded(
                child: ScrollablePositionedList.builder(
                  itemScrollController: itemScrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) => SizedBox(
                    width: screenSize.width,
                    child: RadioItem(
                        radio: radios[index],
                        itemScrollController: itemScrollController,
                        itemIndex: index,
                        lastItem: (index == radios.length - 1 ? true : false)),
                  ),
                  itemCount: radios.length,
                ),
              ),
              // Expanded(
              //   flex: 2,
              //   child: Container(
              //     margin: const EdgeInsets.all(20),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Icon(Icons.skip_previous, color: MyThemeData.colorGold, size: 40,),
              //         Icon(Icons.play_arrow, color: MyThemeData.colorGold, size: 40),
              //         Icon(Icons.skip_next, color: MyThemeData.colorGold, size: 40)
              //       ],
              //     ),
              //   ),
              // )
            ],
          );
        });
  }
}
