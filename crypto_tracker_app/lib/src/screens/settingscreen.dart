import 'package:crypto_tracker_app/src/model/credits.dart';
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

double? howM = 25;

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
            child: ListView(
              itemExtent: 100,
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                currencySelector(
                  context,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF121212),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "How Many ?",
                        style: GoogleFonts.raleway(
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            Get.defaultDialog(
                                backgroundColor: Color(0xFF202020),
                                title: "Hi",
                                content: NumSlider(),
                                actions: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.chevron_left,
                                      ))
                                ]);
                          });
                        },
                        child: Text(
                          howM!.toInt().toString(),
                          style: TextStyle(color: Colors.white, fontSize: 32),
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
                ProdiGinix(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget currencySelector(BuildContext context) {
    return Container(
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
                          _currency = settingService.currency = currency.code;
                          _symbol = settingService.symbol = currency.symbol;
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
    );
  }
}

class NumSlider extends StatefulWidget {
  NumSlider({Key? key}) : super(key: key);

  @override
  _NumSliderState createState() => _NumSliderState();
}

class _NumSliderState extends State<NumSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: howM!,
      min: 0,
      max: 100,
      onChanged: (val) {
        print(val.toInt());
        setState(() {
          howM = val;
        });
      },
    );
  }
}
