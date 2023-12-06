import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_app/core/ui/widgets/image/network_image_component.dart';
import 'package:radio_app/core/ui/widgets/loading/loading_component.dart';
import 'package:radio_app/core/ui/widgets/radio_station_image/radio_station_image_component.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';
import 'package:radio_app/features/radio_station_list/ui/widgets/radio_station_tags/radio_station_tags_component.dart';
import 'package:ripple_wave/ripple_wave.dart';

class RadioStationItemComponent extends StatefulWidget {
  RadioStation radioStation;
  Function(RadioStation radioStation) onItemPressed;
  RadioStationItemComponent(
      {Key? key, required this.radioStation, required this.onItemPressed})
      : super(key: key);

  @override
  State<RadioStationItemComponent> createState() =>
      _RadioStationItemComponentState();
}

class _RadioStationItemComponentState extends State<RadioStationItemComponent> {
  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      animate: true,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () => widget.onItemPressed(widget.radioStation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: Colors.transparent,
          child: Row(
            children: [
              getRadioStationImage(),
              getRadioStationInfo(),
              if (widget.radioStation.isPlaying) showRadioAudioPlaying()
            ],
          ),
        ),
      ),
    );
  }

  getRadioStationImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: RadioStationImageComponent(
        url: widget.radioStation.image,
        onPressed: () {
          widget.onItemPressed(widget.radioStation);
        },
        width: 75.0,
        height: 75.0,
        radius: 100,
        shadow: false,
        rotateWhilePlaying: widget.radioStation.isPlaying,
      ),
    );
  }

  getRadioStationInfo() {
    return Expanded(
      child: Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.radioStation.isPlaying)
                const Text(
                  "Now playing",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.radioStation.name),
              RadioStationTagsComponent(radioStation: widget.radioStation)
            ],
          )),
    );
  }

  showRadioAudioPlaying() {
    return Image.asset(
      'assets/animated/radio_playing.gif',
      height: 35,
      width: 60,
    );
  }
}
