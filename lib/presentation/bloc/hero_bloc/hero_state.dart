part of 'hero_bloc.dart';

abstract class HeroState extends Equatable {
  const HeroState();

  @override
  List<Object> get props => [];
}

class HeroInitial extends HeroState {}

class HeroLoading extends HeroState {}

class HeroFailed extends HeroState {
  final String e;
  const HeroFailed(this.e);

  @override
  List<Object> get props => [e];
}

class HeroSuccess extends HeroState {
  final List<HeroModel> listHeroes;
  const HeroSuccess(this.listHeroes);

  @override
  List<Object> get props => [listHeroes];
}

class SimilarLoading extends HeroState {}

class SimilarFailed extends HeroState {
  final String e;
  const SimilarFailed(this.e);

  @override
  List<Object> get props => [e];
}

class SimilarSuccess extends HeroState {
  final List<HeroModel> listHero;
  const SimilarSuccess(this.listHero);

  @override
  List<Object> get props => [listHero];
}
