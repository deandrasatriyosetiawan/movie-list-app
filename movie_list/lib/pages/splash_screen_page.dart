import "package:flutter/material.dart";
import '/shared/color_manager.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorManager.slateGrey),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo_moli.png",
            height: 120,
            width: 120,
          ),
          const Text(
            "Moli",
            style: TextStyle(
              fontFamily: "SegoePrint",
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  } // build
}
