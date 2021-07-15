import 'package:crypto_tracker_app/src/model/coin.dart';
import 'package:crypto_tracker_app/src/model/settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseurl = "https://api.coingecko.com/api/v3/coins/markets?";

Future<List<Coin>> fetchCoinData() async {
  coinList = [];
  var url = baseurl +
      "vs_currency=${settingService.currency}&order=${settingService.sortBy}&per_page=${settingService.howMany}&page=1&sparkline=false";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List<dynamic> values = [];
    values = json.decode(response.body);
    if (values.length > 0) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          Map<String, dynamic> map = values[i];
          coinList.add(Coin.fromJson(map));
        }
      }
    }
    return coinList;
  } else {
    throw Exception('Failed To Load Data');
  }
  // market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc
}
