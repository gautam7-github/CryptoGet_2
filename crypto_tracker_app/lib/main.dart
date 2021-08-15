import 'package:crypto_tracker_app/src/screens/welcomescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
// flutter run -d chrome --web-renderer html // to run the app
// flutter build web --web-renderer html --release // to generate a production build
  setPathUrlStrategy();
  await GetStorage.init();
  runApp(CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      title: "CryptoGet",
      home: WelcomeScreen(),
    );
  }
}
