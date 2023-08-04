import 'package:flutter/material.dart';

import '../../config/theme.dart';

class HeroCardWidget extends StatelessWidget {
  const HeroCardWidget({
    Key? key,
    required this.imageUrl,
    required this.iconUrl,
    required this.name,
    required this.roles,
    required this.attribute,
    required this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String iconUrl;
  final String name;
  final String roles;
  final String attribute;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: attribute == "str"
                  ? redColor
                  : attribute == 'agi'
                      ? greenColor
                      : attribute == 'int'
                          ? blueColor
                          : greyColor,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      Text(
                        attribute.toUpperCase(),
                        style: attribute == "str"
                            ? redTextStyle.copyWith(fontWeight: semiBold)
                            : attribute == 'agi'
                                ? greenTextStyle.copyWith(fontWeight: semiBold)
                                : attribute == "int"
                                    ? blueTextStyle.copyWith(
                                        fontWeight: semiBold)
                                    : greyTextStyle.copyWith(
                                        fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    roles,
                    style: whiteTextStyle.copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
