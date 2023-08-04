import 'package:flutter/material.dart';

import '../../config/theme.dart';

class SimilarHeroCardWidget extends StatelessWidget {
  const SimilarHeroCardWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            width: 150,
            height: 75,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.5,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
        ),
        Text(
          name,
          style: whiteTextStyle.copyWith(fontWeight: semiBold),
        ),
      ],
    );
  }
}
