import 'dart:convert';

import 'package:dotapedia/data/endpoints/endpoints.dart';
import 'package:dotapedia/data/models/hero_model.dart';
import 'package:http/http.dart' as http;

class HeroService {
  Future<List<HeroModel>> getHero(HeroModel hero) async {
    try {
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode != 200) {
        throw jsonDecode(response.body)["error"];
      }
      final heroJson = jsonDecode(response.body);
      List<HeroModel> listHero = [];

      for (var element in heroJson) {
        hero = HeroModel.fromJson(element);
        listHero.add(hero);
      }

      return listHero;
    } catch (e) {
      rethrow;
    }
  }
}
