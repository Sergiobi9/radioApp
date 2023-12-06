import 'package:audioplayers/audioplayers.dart';
import 'package:radio_app/core/manager/audio/interface/i_audio_player_manager.dart';

class AudioPlayerManager implements IAudioPlayerManager {
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  AudioPlayer getAudioPlayer() {
    return _audioPlayer;
  }

  @override
  Future<void> playAudio({required String source}) async {
    await getAudioPlayer().play(UrlSource(source));
  }

  @override
  Future<void> stopAudio() async {
    await getAudioPlayer().stop();
  }

  @override
  Future<void> resumeAudio() async {
    await getAudioPlayer().resume();
  }

  @override
  Future<void> setVolume({required double volume}) async {
    await getAudioPlayer().setVolume(volume);
  }

  @override
  double getVolume() {
    return getAudioPlayer().volume;
  }
}
