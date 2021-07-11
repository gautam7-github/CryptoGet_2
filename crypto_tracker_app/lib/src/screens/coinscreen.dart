import 'package:crypto_tracker_app/src/model/coin.dart';
import 'package:crypto_tracker_app/src/network/network.dart';
import 'package:crypto_tracker_app/src/screens/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coincard.dart';

class CoinPage extends StatefulWidget {
  CoinPage({Key? key}) : super(key: key);

  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          "CryptoGet".toUpperCase(),
          style: GoogleFonts.raleway(
            textStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await fetchCoinData();
              setState(() {});
            },
            icon: Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              Get.to(
                () => SettingsScreen(),
              );
              setState(() {
                coinList;
              });
            },
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Color(0xFF121212),
      ),
      extendBodyBehindAppBar: false,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await fetchCoinData();
            setState(() {});
          },
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          child: Container(
            color: Color(0xFF121212),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(12),
              scrollDirection: Axis.vertical,
              itemCount: coinList.length,
              itemBuilder: (BuildContext context, int index) {
                return CoinCard(
                  index: index,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
