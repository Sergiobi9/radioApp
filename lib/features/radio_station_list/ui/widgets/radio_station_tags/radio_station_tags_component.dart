import 'package:flutter/material.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';

class RadioStationTagsComponent extends StatelessWidget {
  RadioStation radioStation;
  RadioStationTagsComponent({Key? key, required this.radioStation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        constraints: const BoxConstraints(maxHeight: 65),
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Wrap(
                spacing: 10, runSpacing: 5, children: getRadioStationTags())));
  }

  List<Widget> getRadioStationTags() {
    List<Widget> tags = [];

    for (int i = 0; i < radioStation.tags.length; i++) {
      String tag = radioStation.tags.elementAt(i);
      tags.add(Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: Text(tag)));
    }

    return tags;
  }
}
