import 'package:crypto_tracker_app/src/screens/welcomescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
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
