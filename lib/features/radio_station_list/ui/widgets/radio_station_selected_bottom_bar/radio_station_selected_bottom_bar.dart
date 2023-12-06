import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:radio_app/core/ui/theme/app_theme.dart';
import 'package:radio_app/core/ui/widgets/button/icon_button_component.dart';
import 'package:radio_app/core/ui/widgets/image/network_image_component.dart';
import 'package:radio_app/core/ui/widgets/loading/loading_component.dart';
import 'package:radio_app/core/ui/widgets/radio_station_image/radio_station_image_component.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';

class RadioStationSelectedBottomBar extends StatefulWidget {
  RadioStation radioStation;
  bool isShuffleSelected;
  Function(RadioStation radioStation) onItemPressed;
  Function() onShufflePressed;

  Function() onPausePlayPressed;
  Function() onSwipeRight;
  Function() onSwipeLeft;
  Function() onSwipeUp;

  RadioStationSelectedBottomBar(
      {Key? key,
      required this.radioStation,
      required this.isShuffleSelected,
      required this.onShufflePressed,
      required this.onItemPressed,
      required this.onSwipeLeft,
      required this.onSwipeRight,
      required this.onSwipeUp,
      required this.onPausePlayPressed})
      : super(key: key);

  @override
  State<RadioStationSelectedBottomBar> createState() =>
      _RadioStationSelectedBottomBarState();
}

class _RadioStationSelectedBottomBarState
    extends State<RadioStationSelectedBottomBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SwipeDetector(
          onSwipeLeft: (offset) {
            widget.onSwipeLeft();
          },
          onSwipeRight: (offset) {
            widget.onSwipeRight();
          },
          onSwipeUp: (offset) {
            widget.onSwipeUp();
          },
          child: GestureDetector(
            onTap: () => widget.onItemPressed(widget.radioStation),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Row(
                children: [
                  getRadioStationImage(),
                  getRadioStationInfo(),
                ],
              ),
            ),
          ),
        ));
  }

  getRadioStationImage() {
    return RadioStationImageComponent(
      url: widget.radioStation.image,
      width: 50,
      height: 50,
      onPressed: () {
        widget.onItemPressed(widget.radioStation);
      },
      radius: 100,
      rotateWhilePlaying: widget.radioStation.isPlaying,
    );
  }

  getRadioStationInfo() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Now playing",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.radioStation.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ))),
          getShuffleRadioStationButton(),
          const SizedBox(width: 10),
          getPausePlayButton()
        ],
      ),
    );
  }

  getShuffleRadioStationButton() {
    return IconButtonComponent(
      onPressed: () {
        widget.onShufflePressed();
      },
      tooltip: "Shuffle",
      icon: Icon(
        Icons.shuffle_rounded,
        color: widget.isShuffleSelected ? Colors.green : null,
      ),
    );
  }

  getPausePlayButton() {
    return IconButtonComponent(
      onPressed: () {
        widget.onPausePlayPressed();
      },
      tooltip: widget.radioStation.isPlaying ? "Pause" : "Play",
      icon:
          Icon(widget.radioStation.isPlaying ? Icons.pause : Icons.play_arrow),
    );
  }
}
