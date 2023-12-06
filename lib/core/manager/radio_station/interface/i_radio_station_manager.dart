import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';

abstract class IRadioStationManager {
  List<RadioStation> getRadioStationsList();
  void setRadioStationsList(List<RadioStation> radioStations);

  RadioStation? getCurrentRadioStationSelected();
  void setRadioStationPlaying(RadioStation? radioStation);

  void getNextRadioStation();
  void getPreviousRadioStation();
  void getRandomRadioStation();

  void stopPlayRadioStation();

  bool isShuffleSelected();
  void setSuffleSelected(bool shuffle);
}
