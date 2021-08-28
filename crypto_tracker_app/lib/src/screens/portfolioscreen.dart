import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class portfolioScreen extends StatefulWidget {
  bool? isEmpty = true;
  @override
  _portfolioScreenState createState() => _portfolioScreenState();
}

class _portfolioScreenState extends State<portfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: widget.isEmpty!
            ? Center(
                child: MaterialButton(
                  onPressed: () async {
                    setState(
                      () {
                        Get.defaultDialog(
                          backgroundColor: Color(0xFF202020),
                          radius: 8,
                          titleStyle: GoogleFonts.raleway(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          title: "Select Crypto",
                          buttonColor: Colors.white,
                          content: null,
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Get.back();
                              },
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                child: Text("hi"),
                              ),
                            ),
                          ],
                        );
                        widget.isEmpty = false;
                      },
                    );
                  },
                  child: Text(
                    "+ Click to Add",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                color: Colors.grey,
                child: Center(
                  child: ListView(
                    children: [
                      Container(
                        child: Text("BTC @ 32k"),
                      ),
                      Container(
                        child: Text("ETH @ 1.2k"),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
