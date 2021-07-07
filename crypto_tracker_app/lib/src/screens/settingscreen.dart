import 'package:crypto_tracker_app/src/model/settings.dart';
import 'package:crypto_tracker_app/src/network/network.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _symbol = settingService.symbol;
  var _currency = settingService.currency;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await fetchCoinData();
          Get.back();
        },
        backgroundColor: Color(0xFF2020220),
        child: Icon(
          Icons.chevron_left_rounded,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Selected Currency",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      MaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          HapticFeedback.heavyImpact();
                          setState(
                            () {
                              showCurrencyPicker(
                                context: context,
                                showFlag: true,
                                theme: CurrencyPickerThemeData(
                                  backgroundColor: Colors.white,
                                  titleTextStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  subtitleTextStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                currencyFilter: [
                                  'USD',
                                  'INR',
                                  'JPY',
                                  'EUR',
                                  'GBP',
                                  'AUD',
                                  'CAD',
                                ],
                                physics: BouncingScrollPhysics(),
                                onSelect: (currency) {
                                  print(currency.code);
                                  setState(
                                    () {
                                      _currency = settingService.currency =
                                          currency.code;
                                      _symbol = settingService.symbol =
                                          currency.symbol;
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              "$_symbol ",
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              " $_currency",
                              style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 7,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Get.showSnackbar(
                          GetBar(
                            backgroundColor: Color(0xFF202020),
                            message: "Really?",
                            duration: Duration(seconds: 4),
                            barBlur: 100,
                            isDismissible: true,
                            messageText: Center(
                              child: Text(
                                "Aukaat Hai ?",
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "My Portfolio",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
