import "package:flutter/material.dart";
import "package:get/get.dart";
import "/routes/route_name.dart";
import "/shared/color_manager.dart";
import "/shared/text_style_manager.dart";
import "/shared/box_decoration_manager.dart";

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontFamily: "UbuntuBold",
                fontSize: 26,
                color: Color(ColorManager.blueKoi),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(35),
              child: Image.asset(
                "assets/images/welcome.png",
                width: 302,
                height: 227,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              width: 250,
              height: 50,
              decoration: BoxDecorationManager.darkBoxDecoration,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RouteName.signUpPage);
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyleManager.darkTextButtonStyle,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 35),
              width: 250,
              height: 50,
              decoration: BoxDecorationManager.lightBoxDecoration,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RouteName.loginPage);
                },
                child: const Text(
                  "Login",
                  style: TextStyleManager.lightTextButtonStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // build
}
