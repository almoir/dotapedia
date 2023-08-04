import 'package:flutter/material.dart';

import '../../config/theme.dart';
import '../../config/value.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    this.iconWidth = 50,
    this.iconHeight = 25,
    this.textWidth = 75,
    this.textHeight = 25,
  }) : super(key: key);

  final double iconWidth;
  final double iconHeight;
  final double textWidth;
  final double textHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: iconWidth,
          height: iconHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("$assetsImagePath/dota-icon.png"))),
        ),
        Container(
          width: textWidth,
          height: textHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              invertColors: true,
              image: AssetImage(
                "$assetsImagePath/dota-text.png",
              ),
            ),
          ),
        ),
        Text(
          "pedia",
          style: whiteTextStyle.copyWith(
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
