import 'package:flutter/material.dart';

import '../../config/theme.dart';

class HeroDetailWidget extends StatelessWidget {
  const HeroDetailWidget({
    Key? key,
    required this.iconUrl,
    required this.name,
    required this.type,
    required this.baseAttack,
    required this.baseHealth,
    required this.movementSpeed,
    required this.attribute,
  }) : super(key: key);

  final String iconUrl;
  final String name;
  final String type;
  final String baseAttack;
  final String baseHealth;
  final String movementSpeed;
  final String attribute;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(iconUrl),
                ),
              ),
            ),
            Text(
              name,
              style:
                  whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(10),
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
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Type", style: whiteTextStyle),
                      Text(
                        type,
                        style: whiteTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Base Attack", style: whiteTextStyle),
                      Text(
                        baseAttack,
                        style: whiteTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Base Health", style: whiteTextStyle),
                      Text(
                        baseHealth,
                        style: whiteTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Movement Speed", style: whiteTextStyle),
                      Text(
                        movementSpeed,
                        style: whiteTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Attribute", style: whiteTextStyle),
                      Text(
                        attribute.toUpperCase(),
                        style: attribute == "str"
                            ? redTextStyle.copyWith(fontWeight: semiBold)
                            : attribute == "agi"
                                ? greenTextStyle.copyWith(fontWeight: semiBold)
                                : attribute == "int"
                                    ? blueTextStyle.copyWith(
                                        fontWeight: semiBold)
                                    : greyTextStyle.copyWith(
                                        fontWeight: semiBold),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
