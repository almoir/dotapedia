import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dotapedia/config/theme.dart';
import 'package:dotapedia/data/models/hero_model.dart';
import 'package:dotapedia/presentation/pages/home_page.dart';
import 'package:dotapedia/presentation/widgets/custom_error_widget.dart';

import '../../config/arguments.dart';
import '../../config/methods.dart';
import '../../data/endpoints/endpoints.dart';
import '../bloc/hero_bloc/hero_bloc.dart';
import '../widgets/custom_hero_detail_widget.dart';
import '../widgets/custom_hero_header_widget.dart';
import '../widgets/custom_similiar_hero_card_widget.dart';

class DetailHeroPage extends StatefulWidget {
  static const String routeName = '/detail-hero';
  const DetailHeroPage({super.key});

  @override
  State<DetailHeroPage> createState() => _DetailHeroPageState();
}

class _DetailHeroPageState extends State<DetailHeroPage> {
  HeroModel heroes = HeroModel();
  List<HeroModel> similarHeroes = [];
  @override
  void initState() {
    context.read<HeroBloc>().add(GetSimilar(heroes));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return WillPopScope(
      onWillPop: () async {
        if (true) {
          if (args.fromHome == true) {
            Navigator.pushNamedAndRemoveUntil(
                context, HomePage.routeName, (route) => false);
          } else {
            Navigator.pop(context);
          }
        }
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroHeaderWidget(
                onTap: () {
                  if (args.fromHome == true) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomePage.routeName, (route) => false);
                  } else {
                    Navigator.pop(context);
                  }
                },
                imageUrl: "$imageUrl${args.heroes.img}",
                role: args.heroes.roles!
                    .reduce((value, element) => "$value, $element"),
                attribute: args.heroes.primaryAttr!,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroDetailWidget(
                      iconUrl: "$imageUrl${args.heroes.icon}",
                      name: args.heroes.localizedName!,
                      type: args.heroes.attackType!,
                      baseAttack:
                          "${args.heroes.baseAttackMin} - ${args.heroes.baseAttackMax}",
                      baseHealth: "${args.heroes.baseHealth!}",
                      movementSpeed: "${args.heroes.moveSpeed}",
                      attribute: args.heroes.primaryAttr!,
                    ),
                    Text("Similar Heroes", style: whiteTextStyle),
                    BlocBuilder<HeroBloc, HeroState>(
                      builder: (context, state) {
                        if (state is SimilarFailed) {
                          return Center(
                            child: CustomErrorWidget(
                              message: state.e,
                              showImage: false,
                              errorFontSize: 14,
                              messageFontSize: 10,
                              onPressed: () => context
                                  .read<HeroBloc>()
                                  .add(GetSimilar(heroes)),
                            ),
                          );
                        }
                        if (state is SimilarLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is SimilarSuccess) {
                          similarHeroes = getSimilar(
                            state.listHero,
                            args.heroes.primaryAttr!,
                            args.heroes.localizedName!,
                            similarHeroes,
                          );

                          return SizedBox(
                            height: 150,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: similarHeroes.isNotEmpty ? 3 : 0,
                              itemBuilder: (context, index) {
                                final similarHero = similarHeroes[index];
                                return similarHeroes.isNotEmpty
                                    ? SimilarHeroCardWidget(
                                        imageUrl: "$imageUrl${similarHero.img}",
                                        name: similarHero.localizedName!,
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            DetailHeroPage.routeName,
                                            arguments: ScreenArguments(
                                                similarHero, false),
                                          );
                                        })
                                    : const SizedBox();
                              },
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
