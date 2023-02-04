import 'package:flutter/material.dart';
import 'package:islami_own/models/radio_response.dart';
import 'package:islami_own/my_theme.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islami_own/shared/components/component.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class RadioItem extends StatefulWidget {
  Radios? radio;
  ItemScrollController itemScrollController;
  int itemIndex;
  bool lastItem;
  AudioPlayer audioPlayer;

  RadioItem({required this.radio, required this.itemScrollController, required this.itemIndex, required this.lastItem, required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool playing = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Text(widget.radio?.name ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20), textAlign: TextAlign.center),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  if (widget.itemIndex - 1 >= 0) {
                    widget.itemScrollController.scrollTo(
                        index: widget.itemIndex - 1,
                        duration: const Duration(milliseconds: 100));
                  }
                },
                icon: Icon(Icons.skip_previous, color: MyThemeData.colorGold),
                iconSize: 60),
            loading
                ? const CircularProgressIndicator()
                : IconButton(
                    onPressed: () async {
                      await changePlayState();
                    },
                    icon: Icon(
                        playing
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: MyThemeData.colorGold),
                    iconSize: 60),
            IconButton(
                onPressed: () {
                  if(!widget.lastItem) {
                    widget.itemScrollController.scrollTo(
                      index: widget.itemIndex + 1,
                      duration: const Duration(milliseconds: 100));
                  }
                },
                icon: Icon(Icons.skip_next, color: MyThemeData.colorGold),
                iconSize: 60)
          ],
        )
      ],
    );
  }

  Future<void> changePlayState() async {
    if (widget.radio?.url != null) {
      loading = true;
      setState(() {});
      if (playing) {
        await pause();
      } else {
        await play();
      }
      setState(() {
        playing = !playing;
        loading = false;
      });
    } else {
      showMessage(
          context,
          "Something went wrong, check your internet connection and try again",
          "Replay", () async {
        popNavigator(context);
        await changePlayState();
      }, negAction: () => popNavigator(context));
    }
  }

  Future<void> play() async {
    //assetSource used to play mp3 files from saved files
    await widget.audioPlayer.play(UrlSource(widget.radio!.url!));
  }

  Future<void> pause() async {
    widget.audioPlayer.pause();
  }
}
