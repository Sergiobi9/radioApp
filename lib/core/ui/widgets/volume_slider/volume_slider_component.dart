import 'package:flutter/material.dart';

class VolumeSliderCompoent extends StatefulWidget {
  Function(double volume) onVolumeChanged;
  double currentVolume;

  VolumeSliderCompoent(
      {Key? key, required this.currentVolume, required this.onVolumeChanged})
      : super(key: key);

  @override
  State<VolumeSliderCompoent> createState() => _VolumeSliderCompoentState();
}

class _VolumeSliderCompoentState extends State<VolumeSliderCompoent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Slider(
            activeColor: Colors.black,
            min: 0,
            max: 1,
            onChanged: (volume) async {
              setState(() {
                widget.currentVolume = volume;
                widget.onVolumeChanged(volume);
              });
            },
            value: widget.currentVolume,
          ),
        ),
        Icon(getVolumeIcon())
      ],
    );
  }

  getVolumeIcon() {
    if (widget.currentVolume == 0) {
      return Icons.volume_off_rounded;
    } else if (widget.currentVolume <= 0.65) {
      return Icons.volume_down_rounded;
    } else {
      return Icons.volume_up_rounded;
    }
  }
}
