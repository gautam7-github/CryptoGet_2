import 'package:crypto_tracker_app/src/api/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coinscreen.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void getCoinData() async {
    await fetchCoinData();
    goNext();
    //setState(() {});
  }

  void goNext() {
    Future.delayed(
      Duration(milliseconds: 300),
      () {
        Get.off(
          CoinPage(),
          transition: Transition.cupertino,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 1,
                ),
                CircularProgressIndicator(
                  color: Colors.deepPurple,
                  backgroundColor: Color(0xFF121212),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    "Loading".toUpperCase(),
                    style: GoogleFonts.dmSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Center(
                  child: Image(
                    image: AssetImage(
                      "assets/splashImg.png",
                    ),
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                RichText(
                  text: TextSpan(
                    text: "ProdiGinix",
                    children: [
                      TextSpan(
                        text: "™",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                    style: GoogleFonts.limelight(
                      textStyle: TextStyle(
                        color: Color(0xFFE9A664),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Software. To The Moon.",
                  style: GoogleFonts.antic(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
