part of 'hero_bloc.dart';

abstract class HeroEvent extends Equatable {
  const HeroEvent();

  @override
  List<Object> get props => [];
}

class GetHero extends HeroEvent {
  final HeroModel hero;
  const GetHero(this.hero);

  @override
  List<Object> get props => [hero];
}

class GetSimilar extends HeroEvent {
  final HeroModel hero;
  const GetSimilar(this.hero);

  @override
  List<Object> get props => [hero];
}
