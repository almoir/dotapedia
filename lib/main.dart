import 'package:dotapedia/presentation/bloc/hero_bloc/hero_bloc.dart';
import 'package:dotapedia/presentation/pages/detail_hero_page.dart';
import 'package:dotapedia/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/theme.dart';
import 'presentation/pages/splash_page.dart';

void main() => runApp(const DotaPedia());

class DotaPedia extends StatelessWidget {
  const DotaPedia({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HeroBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationThemeData(),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => const SplashPage(),
          HomePage.routeName: (context) => const HomePage(),
          DetailHeroPage.routeName: (context) => const DetailHeroPage(),
        },
      ),
    );
  }
}
