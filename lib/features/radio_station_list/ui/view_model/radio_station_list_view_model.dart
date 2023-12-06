import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:radio_app/core/constants/country_constants.dart';
import 'package:radio_app/core/constants/country_constants.dart';
import 'package:radio_app/core/manager/audio/audio_player_manager.dart';
import 'package:radio_app/core/manager/audio/interface/i_audio_player_manager.dart';
import 'package:radio_app/core/manager/radio_station/interface/i_radio_station_manager.dart';
import 'package:radio_app/core/manager/radio_station/radio_station_manager.dart';
import 'package:radio_app/core/ui/view_model/base_view_model.dart';
import 'package:radio_app/features/radio_station_detail/module/radio_station_detail_module.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';
import 'package:radio_app/features/radio_station_list/network/repository/interface/i_radio_station_list_repository.dart';
import 'package:radio_app/router/app_router.dart';

class RadioStationListViewModel extends BaseViewModel {
  List<RadioStation> _allRadioStations = [];

  String _countryCode = CountryConstants.COUNTRIES.first.countryCode;

  IRadioStationListRepository repository;
  IRadioStationManager radioStationManager;
  IAudioPlayerManager audioPlayerManager;

  RadioStationListViewModel(
      {required this.repository,
      required this.radioStationManager,
      required this.audioPlayerManager});

  IAudioPlayerManager getAudioPlayerManager() => audioPlayerManager;

  Future<void> fetchRadioStations({String countryCode = ""}) async {
    getAudioPlayerManager().stopAudio();

    if (countryCode.isNotEmpty) {
      setCountryCode(countryCode);
    }

    changeRadioStationCurrentlyPlaying(null);

    setLoading(true);
    setRadioStationsList(
        await repository.fetchRadioStations(countryCode: getCountryCode()));
    setAllRadioStationsList(getRadioStationsList());

    setLoading(false);
  }

  setCountryCode(countryCode) {
    _countryCode = countryCode;
  }

  getCountryCode() => _countryCode;

  List<RadioStation> getRadioStationsList() =>
      radioStationManager.getRadioStationsList();
  setRadioStationsList(List<RadioStation> radioStations) {
    radioStationManager.setRadioStationsList(radioStations);
  }

  List<RadioStation> getAllRadioStationsList() => _allRadioStations;

  setAllRadioStationsList(List<RadioStation> radioStations) {
    _allRadioStations = radioStations;
  }

  void changeRadioStationCurrentlyPlaying(RadioStation? radioStationSelected) {
    radioStationManager.setRadioStationPlaying(radioStationSelected);
    notifyListeners();
  }

  RadioStation? getRadioStationCurrentlyPlaying() =>
      radioStationManager.getCurrentRadioStationSelected();

  void stopPlayRadioStation() {
    radioStationManager.stopPlayRadioStation();
    getAudioPlayerManager().stopAudio();

    if (getRadioStationCurrentlyPlaying()!.isPlaying) {
      audioPlayerManager.playAudio(
          source: getRadioStationCurrentlyPlaying()!.stream);
    }
    notifyListeners();
  }

  void seeRadioStationDetail({required BuildContext context}) {
    AppRouter.routeToPageWithBack(
        context: context, path: RadioStationDetailModule.PATH_NAME);
  }

  void getPreviousRadioStation() {
    radioStationManager.getPreviousRadioStation();
    stopPlayRadioStation();

    notifyListeners();
  }

  void getNextRadioStation() {
    radioStationManager.getNextRadioStation();
    stopPlayRadioStation();

    notifyListeners();
  }

  void filterRadioStations({required String text}) {
    List<RadioStation> filteredRadioStations = [];

    filteredRadioStations = getAllRadioStationsList()
        .where((element) =>
            element.name.toUpperCase().contains(text.toUpperCase()))
        .toList();
    setRadioStationsList(filteredRadioStations);
    notifyListeners();
  }

  void changeShuffleRadio() {
    radioStationManager
        .setSuffleSelected(!radioStationManager.isShuffleSelected());
    notifyListeners();
  }

  bool isShuffleSelected() {
    return radioStationManager.isShuffleSelected();
  }

  String getCountryName() {
    List<Country> countries = CountryConstants.COUNTRIES;
    return countries
        .singleWhere((element) => element.countryCode == getCountryCode())
        .name;
  }
}
