import 'package:audioplayers/audioplayers.dart';

abstract class IAudioPlayerManager {
  AudioPlayer getAudioPlayer();
  Future<void> stopAudio();
  Future<void> resumeAudio();
  Future<void> playAudio({required String source});
  Future<void> setVolume({required double volume});
  double getVolume();
}
