import 'dart:math';

import 'package:radio_app/core/manager/radio_station/interface/i_radio_station_manager.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';

class RadioStationManager extends IRadioStationManager {
  List<RadioStation> _radioStations = [];
  RadioStation? _radioStationSelected;

  bool _isShuffleSelected = false;

  @override
  RadioStation? getCurrentRadioStationSelected() {
    return _radioStationSelected;
  }

  @override
  bool isShuffleSelected() => _isShuffleSelected;

  @override
  void setSuffleSelected(bool suffle) => _isShuffleSelected = suffle;

  @override
  void getNextRadioStation() {
    if (isShuffleSelected()) {
      getRandomRadioStation();
      return;
    }

    int index = getRadioStationsList().indexWhere((radioStation) =>
        radioStation.id == getCurrentRadioStationSelected()!.id);

    if (index == -1) {
      return;
    }
    if ((index + 1) < getRadioStationsList().length) {
      setRadioStationPlaying(getRadioStationsList()[index + 1]);
    } else {
      setRadioStationPlaying(getRadioStationsList()[0]);
    }
  }

  @override
  void getPreviousRadioStation() {
    if (isShuffleSelected()) {
      getRandomRadioStation();
      return;
    }

    int index = getRadioStationsList().indexWhere((radioStation) =>
        radioStation.id == getCurrentRadioStationSelected()!.id);

    if (index == -1) {
      return;
    }

    if ((index - 1) >= 0) {
      setRadioStationPlaying(getRadioStationsList()[index - 1]);
    } else {
      setRadioStationPlaying(
          getRadioStationsList()[getRadioStationsList().length - 1]);
    }
  }

  @override
  List<RadioStation> getRadioStationsList() {
    return _radioStations;
  }

  @override
  void getRandomRadioStation() {
    int index = getRadioStationsList().indexWhere((radioStation) =>
        radioStation.id == getCurrentRadioStationSelected()!.id);

    int randomIndex = _getRandomIndex();
    while (randomIndex == index) {
      randomIndex = _getRandomIndex();
    }

    setRadioStationPlaying(getRadioStationsList()[randomIndex]);
  }

  _getRandomIndex() {
    final random = Random();

    return (0 + random.nextInt(getRadioStationsList().length - 0 + 1));
  }

  @override
  void setRadioStationPlaying(RadioStation? radioStation) {
    getRadioStationsList().forEach((element) {
      element.isPlaying = false;
    });
    _radioStationSelected = radioStation;
  }

  @override
  void setRadioStationsList(List<RadioStation> radioStations) {
    _radioStations = radioStations;
  }

  @override
  void stopPlayRadioStation() {
    getCurrentRadioStationSelected()!.isPlaying =
        !getCurrentRadioStationSelected()!.isPlaying;
  }
}
