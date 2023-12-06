import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkImageComponent extends StatelessWidget {
  String url;
  Function()? onImagePressed;
  double width;
  double height;
  Widget? errorImage;
  bool shadow;
  double radius;
  String semanticsLabel = "";

  NetworkImageComponent(
      {super.key,
      required this.url,
      this.onImagePressed,
      this.width = 100.0,
      this.height = 100.0,
      this.shadow = false,
      this.radius = 0,
      this.semanticsLabel = "",
      this.errorImage});

  BoxFit fit = BoxFit.cover;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onImagePressed != null
            ? () {
                onImagePressed!();
              }
            : null,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              boxShadow: shadow
                  ? [
                      const BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 15,
                      ),
                    ]
                  : []),
          child: SizedBox(
            width: width,
            height: height,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: buildImage()),
          ),
        ));
  }

  buildImage() {
    if (url.endsWith('.svg')) {
      return SvgPicture.network(
        url,
        semanticsLabel: semanticsLabel,
        // ignore: deprecated_member_use
        fit: fit,
        placeholderBuilder: (context) =>
            errorImage ?? Image.asset('assets/images/cd_icon.png'),
      );
    }

    return Image.network(
      url,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return errorImage ?? Image.asset('assets/images/cd_icon.png');
      },
    );
  }
}
