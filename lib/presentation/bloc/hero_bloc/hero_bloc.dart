import 'package:bloc/bloc.dart';
import 'package:dotapedia/data/models/hero_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/services/hero_service.dart';

part 'hero_event.dart';
part 'hero_state.dart';

class HeroBloc extends Bloc<HeroEvent, HeroState> {
  HeroBloc() : super(HeroInitial()) {
    on<HeroEvent>((event, emit) async {
      List<HeroModel> listHero = [];
      if (event is GetHero) {
        try {
          emit(HeroLoading());
          await HeroService()
              .getHero(event.hero)
              .then((value) => listHero = value);
          emit(HeroSuccess(listHero));
        } catch (e) {
          emit(HeroFailed(e.toString()));
        }
      }

      if (event is GetSimilar) {
        try {
          emit(SimilarLoading());
          await HeroService()
              .getHero(event.hero)
              .then((value) => listHero = value);
          emit(SimilarSuccess(listHero));
        } catch (e) {
          emit(SimilarFailed(e.toString()));
        }
      }
    });
  }
}
