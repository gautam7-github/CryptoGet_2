import 'package:crypto_tracker_app/src/model/coin.dart';
import 'package:crypto_tracker_app/src/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'fullpagecard.dart';
import 'package:flutter/services.dart';

class CoinCard extends StatefulWidget {
  final index;
  CoinCard({required this.index});
  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.index);
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        Navigator.push(
          context,
          CupertinoPageRoute(
            maintainState: true,
            builder: (BuildContext context) =>
                FullPageCard(index: widget.index),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        child: Container(
          height: (MediaQuery.of(context).size.height / 5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(-1, -1),
                blurRadius: 1,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(1, 1),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
            color: Color(0xFF121212),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            border: Border.all(color: Colors.grey.shade600),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Hero(
                      tag: "${widget.index}",
                      child: Image.network(
                        coinList[widget.index].image.toString(),
                        fit: BoxFit.scaleDown,
                        scale: 0.7,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coinList[widget.index].name.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${coinList[widget.index].symbol.toString().toUpperCase()} / ${settingService.currency!.toUpperCase()}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      (coinList[widget.index].currentPrice!.toDouble() * 0.995)
                          .toStringAsFixed(2),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      coinList[widget.index]
                          .priceChange24h!
                          .toDouble()
                          .toStringAsFixed(3),
                      style: TextStyle(
                        color:
                            (coinList[widget.index].priceChange24h!.toDouble() >
                                    0)
                                ? Colors.green
                                : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${coinList[widget.index].priceChangePercentage24h!.toDouble().toStringAsFixed(2)}%",
                      style: TextStyle(
                        color: (coinList[widget.index]
                                    .priceChangePercentage24h!
                                    .toDouble() >
                                0)
                            ? Colors.green
                            : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
