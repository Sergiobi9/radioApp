import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_app/core/ui/widgets/image/network_image_component.dart';
import 'package:radio_app/core/ui/widgets/radio_station_image/radio_station_image_component.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';
import 'package:radio_app/features/radio_station_list/ui/widgets/radio_station_item/radio_station_item_component.dart';

class RadioStationItemListComponent extends StatefulWidget {
  List<RadioStation> radioStations;
  Function(RadioStation radioStation) onItemPressed;
  RadioStationItemListComponent(
      {Key? key, required this.radioStations, required this.onItemPressed})
      : super(key: key);

  @override
  State<RadioStationItemListComponent> createState() =>
      _RadioStationItemListComponentState();
}

class _RadioStationItemListComponentState
    extends State<RadioStationItemListComponent> {
  @override
  Widget build(BuildContext context) {
    if (widget.radioStations.isEmpty) {
      return noResultsFound();
    }
    return SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            key: const Key('radio_station_list'),
            itemCount: widget.radioStations.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RadioStationItemComponent(
                radioStation: widget.radioStations.elementAt(index),
                onItemPressed: (RadioStation radioStation) {
                  widget.onItemPressed(radioStation);
                },
              );
            }));
  }

  noResultsFound() {
    return FadeIn(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("No radio stations were found"),
        RadioStationImageComponent(
          height: 100,
          width: 100,
        )
      ],
    ));
  }
}
