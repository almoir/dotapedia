import 'package:dotapedia/config/methods.dart';
import 'package:dotapedia/data/models/hero_model.dart';
import 'package:dotapedia/presentation/pages/detail_hero_page.dart';
import 'package:dotapedia/presentation/widgets/custom_error_widget.dart';
import 'package:dotapedia/presentation/widgets/custom_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/arguments.dart';
import '../../config/theme.dart';
import '../../data/endpoints/endpoints.dart';
import '../bloc/hero_bloc/hero_bloc.dart';
import '../widgets/custom_hero_card_widget.dart';
import '../widgets/custom_role_chip_widget.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> role = [
    "Carry",
    "Nuker",
    "Initiator",
    "Disabler",
    "Durable",
    "Escape",
    "Support",
    "Pusher",
  ];
  List<String> selectedRole = [];
  bool selectCarry = false;
  bool selectNuker = false;
  bool selectInitiator = false;
  bool selectDisabler = false;
  bool selectDurable = false;
  bool selectEscape = false;
  bool selectSupport = false;
  bool selectPusher = false;
  bool selectJungler = false;

  HeroModel heroes = HeroModel();

  @override
  void initState() {
    context.read<HeroBloc>().add(GetHero(heroes));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const LogoWidget(),
        elevation: 0,
      ),
      body: BlocBuilder<HeroBloc, HeroState>(
        builder: (context, state) {
          if (state is HeroFailed) {
            return Center(
              child: CustomErrorWidget(
                message: state.e,
                onPressed: () => context.read<HeroBloc>().add(
                      GetHero(heroes),
                    ),
              ),
            );
          }
          if (state is HeroLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HeroSuccess) {
            final listHeroes = state.listHeroes.where((element) {
              return selectedRole.isEmpty ||
                  selectedRole.contains(getRole(element, "Carry")) ||
                  selectedRole.contains(getRole(element, "Nuker")) ||
                  selectedRole.contains(getRole(element, "Initiator")) ||
                  selectedRole.contains(getRole(element, "Disabler")) ||
                  selectedRole.contains(getRole(element, "Durable")) ||
                  selectedRole.contains(getRole(element, "Escape")) ||
                  selectedRole.contains(getRole(element, "Support")) ||
                  selectedRole.contains(getRole(element, "Pusher"));
            }).toList();

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: role
                              .map((e) => RoleChipWidget(
                                    title: e,
                                    selectRole: selectedRole.contains(e),
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          selectedRole.add(e);
                                        } else {
                                          selectedRole.remove(e);
                                        }
                                      });
                                    },
                                  ))
                              .toList()),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Hero List",
                    style: whiteTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: listHeroes.length,
                      itemBuilder: (context, index) {
                        final heroes = listHeroes[index];
                        return HeroCardWidget(
                          imageUrl: "$imageUrl${heroes.img}",
                          iconUrl: "$imageUrl${heroes.icon}",
                          name: heroes.localizedName ?? "Error",
                          roles: heroes.roles!
                              .reduce((value, element) => '$value, $element'),
                          attribute: heroes.primaryAttr!,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              DetailHeroPage.routeName,
                              arguments: ScreenArguments(heroes, true),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CustomErrorWidget(
              message: "No Data Found",
              onPressed: () => context.read<HeroBloc>().add(
                    GetHero(heroes),
                  ),
            ),
          );
        },
      ),
    );
  }
}
