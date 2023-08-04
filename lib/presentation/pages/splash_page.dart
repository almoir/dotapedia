import 'dart:async';

import 'package:dotapedia/config/methods.dart';
import 'package:dotapedia/config/theme.dart';
import 'package:dotapedia/config/value.dart';
import 'package:dotapedia/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/splash";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: deviceSize(context).width * 0.75,
          height: deviceSize(context).height * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.asset("$assetsImagePath/dota-logo.png",
                      color: whiteColor)),
              Text(
                "pedia",
                style: whiteTextStyle.copyWith(
                  fontSize: 27,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
