import 'package:flutter/material.dart';

import '../../config/methods.dart';
import '../../config/theme.dart';

class HeroHeaderWidget extends StatelessWidget {
  const HeroHeaderWidget({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.role,
    required this.attribute,
  }) : super(key: key);

  final VoidCallback onTap;
  final String imageUrl;
  final String role;
  final String attribute;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: deviceSize(context).height * 0.3,
          decoration: BoxDecoration(
            color: secondColor,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 10,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: secondColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, color: whiteColor),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: -5,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              border: Border.all(
                color: attribute == "str"
                    ? redColor
                    : attribute == "agi"
                        ? greenColor
                        : attribute == "int"
                            ? blueColor
                            : greyColor,
              ),
            ),
            child: Text(
              role,
              style: whiteTextStyle.copyWith(
                  fontSize: 12, fontStyle: FontStyle.italic),
              textAlign: TextAlign.right,
              maxLines: null,
            ),
          ),
        ),
      ],
    );
  }
}
