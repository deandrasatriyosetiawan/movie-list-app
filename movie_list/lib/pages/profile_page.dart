import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:firebase_auth/firebase_auth.dart";
import "/routes/route_name.dart";
import "/shared/color_manager.dart";
import "/shared/text_style_manager.dart";
import "/shared/box_decoration_manager.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static final String _emailUser = _firebaseAuth.currentUser!.email.toString();
  static const String username = "deandra_satriyo";
  static const String name = "Deandra Satriyo Setiawan";

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
                      Get.toNamed(RouteName.homePage);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    iconSize: 25,
                    color: const Color(ColorManager.davyGrey),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  const Text(
                    "Profile",
                    style: TextStyleManager.headerTextStyle,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(35),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox.fromSize(
                  child: Image.asset(
                    "assets/images/profile_picture_square.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 15, 24, 20),
              padding: const EdgeInsets.fromLTRB(13, 11, 13, 11),
              width: 314,
              height: 40,
              decoration: BoxDecorationManager.profileInfoBoxDecoration,
              child: Text(
                username,
                style: TextStyleManager.textFieldStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 15, 24, 20),
              padding: const EdgeInsets.fromLTRB(13, 11, 13, 11),
              width: 314,
              height: 40,
              decoration: BoxDecorationManager.profileInfoBoxDecoration,
              child: Text(
                name,
                style: TextStyleManager.textFieldStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 15, 24, 20),
              padding: const EdgeInsets.fromLTRB(13, 11, 13, 11),
              width: 314,
              height: 40,
              decoration: BoxDecorationManager.profileInfoBoxDecoration,
              child: Text(
                _emailUser,
                style: TextStyleManager.textFieldStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: 250,
              height: 50,
              decoration: BoxDecorationManager.darkBoxDecoration,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RouteName.logoutPage);
                },
                child: const Text(
                  "Logout",
                  style: TextStyleManager.darkTextButtonStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // build
}
