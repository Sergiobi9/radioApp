import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_app/core/ui/widgets/radio_station_image/radio_station_image_component.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';
import 'package:ripple_wave/ripple_wave.dart';

class RadioStationDetailInfoComponent extends StatefulWidget {
  RadioStation radioStation;
  Function()? onImagePressed;

  RadioStationDetailInfoComponent(
      {Key? key, required this.radioStation, this.onImagePressed})
      : super(key: key);

  @override
  State<RadioStationDetailInfoComponent> createState() =>
      _RadioStationDetailInfoComponentState();
}

class _RadioStationDetailInfoComponentState
    extends State<RadioStationDetailInfoComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getRipple(),
      ],
    );
  }

  getRipple() {
    return widget.radioStation.isPlaying
        ? RippleWave(
            color: const Color.fromARGB(255, 213, 213, 213),
            repeat: true,
            child: getRadioStationImage())
        : getRadioStationImage();
  }

  getRadioStationImage() => RadioStationImageComponent(
        url: widget.radioStation.image,
        onPressed: () {
          if (widget.onImagePressed != null) {
            widget.onImagePressed!();
          }
        },
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.width * 0.45,
        shadow: false,
        radius: 100,
        rotateWhilePlaying: widget.radioStation.isPlaying,
      );
}
