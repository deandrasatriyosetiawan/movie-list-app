import "package:flutter/material.dart";
import "package:get/get.dart";
import "/routes/route_name.dart";
import "package:firebase_auth/firebase_auth.dart";
import "/shared/color_manager.dart";
import "/shared/text_style_manager.dart";
import "/shared/box_decoration_manager.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then((value) => Get.toNamed(RouteName.homePage));
    } catch (e) {
      final String errorMessage = e.toString();
      final snackbar = SnackBar(
        content: Text(errorMessage),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 60, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed(RouteName.welcomePage);
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      iconSize: 25,
                      color: const Color(ColorManager.davyGrey),
                    ),
                    const SizedBox(
                      width: 95,
                    ),
                    const Text(
                      "Login",
                      style: TextStyleManager.headerTextStyle,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(35),
                child: Image.asset(
                  "assets/images/sign_up_or_login.png",
                  width: 52,
                  height: 88,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 10, 24, 20),
                width: 314,
                height: 40,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  showCursor: true,
                  cursorColor: const Color(ColorManager.blueKoi),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.bottom,
                  textCapitalization: TextCapitalization.none,
                  style: TextStyleManager.textFieldStyle,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: Color(ColorManager.blueKoi),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(ColorManager.blueKoi),
                      ),
                    ),
                    labelText: "email",
                    labelStyle: TextStyleManager.textFieldStyle,
                    hintText: "Please input your email",
                    hintStyle: TextStyleManager.textFieldStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(24, 15, 24, 20),
                width: 314,
                height: 40,
                child: TextField(
                  controller: _passwordController,
                  showCursor: true,
                  obscureText: true,
                  cursorColor: const Color(ColorManager.blueKoi),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.bottom,
                  textCapitalization: TextCapitalization.none,
                  style: TextStyleManager.textFieldStyle,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        color: Color(ColorManager.blueKoi),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(ColorManager.blueKoi),
                      ),
                    ),
                    labelText: "password",
                    labelStyle: TextStyleManager.textFieldStyle,
                    hintText: "Please input your password",
                    hintStyle: TextStyleManager.textFieldStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 68),
                width: 250,
                height: 50,
                decoration: BoxDecorationManager.lightBoxDecoration,
                child: TextButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text(
                    "Login",
                    style: TextStyleManager.lightTextButtonStyle,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 66),
                child: Column(
                  children: [
                    const Text(
                      "Login with:",
                      style: TextStyle(
                        fontFamily: "UbuntuRegular",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/logo_google.png",
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/logo_facebook.png",
                            width: 35,
                            height: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/images/logo_instagram.png",
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } // build
}
