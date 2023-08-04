import 'package:flutter/material.dart';

import '../../config/theme.dart';

class RoleChipWidget extends StatelessWidget {
  const RoleChipWidget({
    Key? key,
    required this.title,
    required this.selectRole,
    required this.onSelected,
  }) : super(key: key);

  final String title;
  final bool selectRole;
  final Function(bool value) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: FilterChip(
        label: Text(title, style: selectRole ? blackTextStyle : whiteTextStyle),
        selected: selectRole,
        selectedColor: whiteColor,
        backgroundColor: secondColor,
        onSelected: onSelected,
      ),
    );
  }
}
