import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:radio_app/features/radio_station_list/network/data_source/radio_station_list_data_source.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';
import 'package:radio_app/features/radio_station_list/network/repository/interface/i_radio_station_list_repository.dart';

class RadioStationListRepository extends IRadioStationListRepository {
  RadioStationListDataSource dataSource;

  RadioStationListRepository({required this.dataSource});
  @override
  Future<List<RadioStation>> fetchRadioStations(
      {String countryCode = "", List<String> tags = const []}) async {
    dynamic response = await dataSource.fetchRadioStations(
        countryCode: countryCode, tags: tags);
    return response['stations']
        .map((radioStation) => RadioStation.fromJsonMap(radioStation))
        .toList()
        .cast<RadioStation>();
  }
}
