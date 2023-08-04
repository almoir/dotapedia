import 'package:flutter/material.dart';

import '../../config/theme.dart';

class RoleCardWidget extends StatelessWidget {
  const RoleCardWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 25,
        decoration: BoxDecoration(
          color: isSelected ? blackColor : whiteColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: isSelected ? whiteTextStyle : blackTextStyle,
          ),
        ),
      ),
    );
  }
}
