import 'package:dotapedia/data/models/hero_model.dart';
import 'package:flutter/material.dart';

Size deviceSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Widget appBarHeight(BuildContext context) {
  return SizedBox(height: AppBar().preferredSize.height);
}

List<HeroModel> getSimilar(List<HeroModel> listHeroes, String attribute,
    String localizedName, List<HeroModel> similarHeroes) {
  listHeroes.removeWhere((element) => element.primaryAttr != attribute);
  if (attribute == "str") {
    listHeroes.sort((a, b) => a.baseAttackMax!.compareTo(b.baseAttackMax!));
  } else if (attribute == "agi") {
    listHeroes.sort((a, b) => a.moveSpeed!.compareTo(b.moveSpeed!));
  } else if (attribute == "int") {
    listHeroes.sort((a, b) => a.baseMana!.compareTo(b.baseMana!));
  } else {
    listHeroes.sort((a, b) => a.baseHealth!.compareTo(b.baseHealth!));
  }
  similarHeroes = listHeroes.reversed.toList();
  similarHeroes
      .removeWhere((element) => element.localizedName == localizedName);
  return similarHeroes;
}

List<HeroModel> getRoleList(List<HeroModel> inputlist, String role) {
  List<HeroModel> outputList = inputlist
      .where((o) =>
          o.roles!.reduce((value, element) => '$value, $element') == role)
      .toList();
  return outputList;
}

String getRole(HeroModel element, String pickedRole) {
  final role = element.roles!.where((element) => element == pickedRole);
  return role.toString().replaceAll("(", "").replaceAll(")", "");
}
