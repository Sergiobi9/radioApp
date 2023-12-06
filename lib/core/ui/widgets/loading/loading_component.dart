import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_app/core/ui/theme/app_theme.dart';

class LoadingComponent extends StatefulWidget {
  String message;
  double width;
  double height;
  LoadingComponent(
      {Key? key, this.message = "", this.width = 50, this.height = 50})
      : super(key: key);

  @override
  State<LoadingComponent> createState() => _LoadingComponentState();
}

class _LoadingComponentState extends State<LoadingComponent>
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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
          child: Image.asset(
            'assets/images/cd_icon.png',
            width: widget.width,
            height: widget.height,
          ),
        ),
        getMessage()
      ],
    );
  }

  getMessage() {
    if (widget.message.isEmpty) return const SizedBox();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        widget.message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
