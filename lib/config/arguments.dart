import '../data/models/hero_model.dart';

class ScreenArguments {
  ScreenArguments(
    this.heroes,
    this.fromHome,
  );
  final HeroModel heroes;
  final bool fromHome;
}
