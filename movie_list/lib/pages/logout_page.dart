import "package:flutter/material.dart";
import "package:get/get.dart";
import "/routes/route_name.dart";
import "package:firebase_auth/firebase_auth.dart";
import "/shared/color_manager.dart";
import "/shared/text_style_manager.dart";
import "/shared/box_decoration_manager.dart";

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> _logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 60, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(RouteName.profilePage);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    iconSize: 25,
                    color: const Color(ColorManager.davyGrey),
                  ),
                  const SizedBox(
                    width: 88,
                  ),
                  const Text(
                    "Logout",
                    style: TextStyleManager.headerTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(55, 35, 35, 35),
              child: Image.asset(
                "assets/images/logout.png",
                width: 250,
                height: 285,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 15, 24, 20),
              width: 278,
              height: 56,
              child: const Text(
                "Are you sure to logout from this account?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "UbuntuRegular",
                  fontSize: 24,
                  color: Color(ColorManager.blueKoi),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: 286,
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecorationManager.darkBoxDecoration,
                    width: 120,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        _logout().then(
                            (value) => Get.toNamed(RouteName.welcomePage));
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyleManager.darkTextButtonStyle,
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecorationManager.lightBoxDecoration,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.profilePage);
                      },
                      child: const Text(
                        "No",
                        style: TextStyleManager.lightTextButtonStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } // build
}
