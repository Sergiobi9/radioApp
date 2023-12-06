import 'package:flutter/material.dart';
import 'package:radio_app/core/ui/widgets/button/icon_button_component.dart';
import 'package:radio_app/core/ui/widgets/volume_slider/volume_slider_component.dart';

class BottomRadioStationDetailButtonsComponent extends StatefulWidget {
  Function() onShuffleButtonPressed;
  Function() onPreviousButtonPressed;
  Function() onNextButtonPressed;
  Function() onPlayPauseButtonPressed;
  Function() onShareButtonPressed;
  Function(double volume) onVolumeChanged;
  double currentVolume;
  bool isShuffleSelected;
  bool isPlaying;

  BottomRadioStationDetailButtonsComponent(
      {Key? key,
      required this.onShuffleButtonPressed,
      required this.onPreviousButtonPressed,
      required this.onPlayPauseButtonPressed,
      required this.onNextButtonPressed,
      required this.onShareButtonPressed,
      required this.onVolumeChanged,
      required this.currentVolume,
      required this.isPlaying,
      required this.isShuffleSelected})
      : super(key: key);

  @override
  State<BottomRadioStationDetailButtonsComponent> createState() =>
      _BottomRadioStationDetailButtonsComponentState();
}

class _BottomRadioStationDetailButtonsComponentState
    extends State<BottomRadioStationDetailButtonsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 35, right: 35, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getShuffleRadioStationButton(),
                getPreviousRadioStationButton(),
                getPlayPauseButton(),
                getNextRadioStationButton(),
                getShareButton()
              ],
            ),
            VolumeSliderCompoent(
              onVolumeChanged: (volume) {
                widget.onVolumeChanged(volume);
              },
              currentVolume: widget.currentVolume,
            ),
          ],
        ));
  }

  getShareButton() {
    return IconButtonComponent(
      onPressed: () {
        widget.onShareButtonPressed();
      },
      tooltip: "Share",
      icon: const Icon(
        Icons.share_rounded,
        size: 30,
      ),
    );
  }

  getShuffleRadioStationButton() {
    return IconButtonComponent(
      onPressed: () {
        widget.onShuffleButtonPressed();
      },
      tooltip: "Shuffle",
      icon: Icon(
        Icons.shuffle_rounded,
        size: 30,
        color: widget.isShuffleSelected ? Colors.green : null,
      ),
    );
  }

  getPreviousRadioStationButton() {
    return IconButtonComponent(
      onPressed: () {
        widget.onPreviousButtonPressed();
      },
      tooltip: "Previous radio station",
      icon: const Icon(
        Icons.skip_previous_rounded,
        size: 60,
      ),
    );
  }

  getNextRadioStationButton() {
    return IconButtonComponent(
      onPressed: () {
        widget.onNextButtonPressed();
      },
      tooltip: "Next radio station",
      icon: const Icon(
        Icons.skip_next_rounded,
        size: 60,
      ),
    );
  }

  getPlayPauseButton() {
    return IconButtonComponent(
      onPressed: () {
        widget.onPlayPauseButtonPressed();
      },
      tooltip: widget.isPlaying ? "Pause" : "Play",
      icon: Icon(
        widget.isPlaying ? Icons.pause : Icons.play_arrow,
        size: 60,
      ),
    );
  }
}
