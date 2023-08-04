import 'package:flutter/material.dart';

import '../../config/methods.dart';
import '../../config/theme.dart';
import '../../config/value.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(
      {Key? key,
      required this.message,
      required this.onPressed,
      this.showImage = true,
      this.errorFontSize = 24,
      this.messageFontSize = 14})
      : super(key: key);

  final String message;
  final VoidCallback onPressed;
  final bool showImage;
  final double errorFontSize;
  final double messageFontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showImage
              ? Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  width: deviceSize(context).width * 0.3,
                  height: deviceSize(context).height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("$assetsImagePath/error.png"),
                    ),
                  ),
                )
              : const SizedBox(),
          Text(
            "Error",
            style: whiteTextStyle.copyWith(
                fontSize: errorFontSize, fontWeight: semiBold),
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: whiteTextStyle.copyWith(fontSize: messageFontSize),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: secondColor),
            child: Text(
              "Retry",
              style: whiteTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
