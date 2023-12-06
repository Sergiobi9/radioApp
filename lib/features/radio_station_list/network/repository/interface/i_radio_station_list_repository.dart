import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';

abstract class IRadioStationListRepository {
  Future<List<RadioStation>> fetchRadioStations(
      {String countryCode = "", List<String> tags = const []});
}
