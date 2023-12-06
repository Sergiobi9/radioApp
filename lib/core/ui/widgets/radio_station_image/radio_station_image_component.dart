import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_app/core/ui/theme/app_theme.dart';
import 'package:radio_app/core/ui/widgets/image/network_image_component.dart';

class RadioStationImageComponent extends StatefulWidget {
  String url;
  double width;
  double height;
  double radius;
  bool shadow;
  bool rotateWhilePlaying;
  Function()? onPressed;

  RadioStationImageComponent(
      {Key? key,
      this.url = "",
      this.width = 50,
      this.height = 50,
      this.shadow = false,
      this.rotateWhilePlaying = true,
      this.onPressed,
      this.radius = 0})
      : super(key: key);

  @override
  State<RadioStationImageComponent> createState() => _LoadingComponentState();
}

class _LoadingComponentState extends State<RadioStationImageComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        if (animationController.status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: widget.rotateWhilePlaying
              ? RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 1.0).animate(animationController),
                  child: getRadioStationImage())
              : getRadioStationImage(),
        )
      ],
    );
  }

  getRadioStationImage() => NetworkImageComponent(
        url: widget.url,
        shadow: widget.shadow,
        onImagePressed: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },
        radius: widget.radius,
      );
}
