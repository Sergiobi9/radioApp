import 'package:audioplayers/audioplayers.dart';
import 'package:radio_app/core/manager/audio/interface/i_audio_player_manager.dart';
import 'package:radio_app/core/manager/radio_station/interface/i_radio_station_manager.dart';
import 'package:radio_app/core/manager/radio_station/radio_station_manager.dart';
import 'package:radio_app/core/ui/view_model/base_view_model.dart';
import 'package:radio_app/core/utils/share/share_utils.dart';
import 'package:radio_app/features/radio_station_list/network/model/radio_station.dart';

class RadioStationDetailViewModel extends BaseViewModel {
  IRadioStationManager radioStationManager;
  IAudioPlayerManager audioPlayerManager;

  RadioStationDetailViewModel(
      {required this.radioStationManager, required this.audioPlayerManager});

  IAudioPlayerManager getAudioPlayerManager() {
    return audioPlayerManager;
  }

  void setRadioStation({required RadioStation radioStation}) {
    radioStationManager.setRadioStationPlaying(radioStation);
  }

  RadioStation getRadioStation() {
    return radioStationManager.getCurrentRadioStationSelected()!;
  }

  void stopPlayRadioStation() {
    radioStationManager.getCurrentRadioStationSelected()!.isPlaying =
        !getRadioStation().isPlaying;

    audioPlayerManager.stopAudio();

    if (getRadioStation().isPlaying) {
      audioPlayerManager.playAudio(source: getRadioStation().stream);
    }
    notifyListeners();
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

  void setAudioVolume({required double volume}) {
    audioPlayerManager.setVolume(volume: volume);
  }

  getAudioVolume() => audioPlayerManager.getVolume();

  void getRandomRadioStation() {
    radioStationManager.getRandomRadioStation();
    stopPlayRadioStation();

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

  void shareRadioStation() {
    ShareUtils.share(getRadioStation().stream);
  }
}
