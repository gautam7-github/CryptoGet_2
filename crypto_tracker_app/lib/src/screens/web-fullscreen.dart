import 'package:crypto_tracker_app/src/model/coin.dart';
import 'package:crypto_tracker_app/src/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class webFullScreen extends StatelessWidget {
  final index;
  const webFullScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF202020),
        foregroundColor: Colors.white,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        elevation: 20,
        onPressed: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Container(
          color: Color(0xFF121212),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            children: [
              coinImageCard(
                context,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 7),
              ),
              coinNameCard(
                context,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 7),
              ),
              coinPriceCard(
                context,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 7),
              ),
              coinRangeCard(
                context,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height / 7),
              ),
              coinMCapCard(
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget coinImageCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Hero(
          tag: "$index",
          child: Image.network(
            coinList[index].image.toString(),
            filterQuality: FilterQuality.high,
            scale: 1.3,
            isAntiAlias: true,
          ),
        ),
      ),
    );
  }

  Widget coinNameCard(BuildContext context) {
    print((MediaQuery.of(context).size.width / 10));
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "#${coinList[index].marketCapRank.toString()}",
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width / 10),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              coinList[index].name.toString(),
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width / 12),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "${coinList[index].symbol.toString().toUpperCase()} / ${settingService.currency!.toUpperCase()}",
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width / 10),
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget coinPriceCard(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "CMP",
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width / 15),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "${coinList[index].currentPrice!.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width / 12),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Transform.rotate(
                      angle: (coinList[index]
                                  .priceChangePercentage24h!
                                  .toDouble() <
                              0)
                          ? 0.785398 * 3
                          : 0.785398,
                      child: Icon(
                        Icons.arrow_circle_up_rounded,
                        color: (coinList[index]
                                    .priceChangePercentage24h!
                                    .toDouble() <
                                0)
                            ? Colors.red
                            : Colors.green,
                        size: 72,
                      ),
                    ),
                  ),
                  Text(
                    "${coinList[index].priceChange24h!.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width / 9),
                      fontWeight: FontWeight.w400,
                      color: (coinList[index]
                                  .priceChangePercentage24h!
                                  .toDouble() <
                              0)
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                  Text(
                    "(${coinList[index].priceChangePercentage24h!.toStringAsFixed(2)}%)",
                    style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width / 15),
                      fontWeight: FontWeight.w200,
                      color: (coinList[index]
                                  .priceChangePercentage24h!
                                  .toDouble() <
                              0)
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget coinRangeCard(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Today's Range",
            style: TextStyle(
              fontSize: (MediaQuery.of(context).size.width / 16),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                coinList[index].high24h.toString(),
                style: TextStyle(
                  color: Colors.green,
                  fontSize: (MediaQuery.of(context).size.width / 12),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " / ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (MediaQuery.of(context).size.width / 10),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                coinList[index].low24h.toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: (MediaQuery.of(context).size.width / 12),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget coinMCapCard(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Market Cap",
            style: TextStyle(
              fontSize: (MediaQuery.of(context).size.width / 18),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "${coinList[index].marketCap!.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: (MediaQuery.of(context).size.width / 18),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
