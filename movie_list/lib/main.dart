import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:firebase_core/firebase_core.dart";
import "routes/route_manager.dart";
import "pages/welcome_page.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      getPages: RouteManager.pages,
    );
  }
}
