class Settings {
  String? currency = "INR";
  String? symbol = "₹";
  String? sortBy = "market_cap_desc";
  int? howMany = 25;
  Map<String, String> orderBy = {
    'market_cap_dec': 'Market Cap Desc',
    'market_cap_asc': 'Market Cap Asce',
    'volume_dec': 'Volume Desc',
    'volume_asc': 'Volume Asce',
    'gecko_desc': 'Curated',
  };
}
// https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=inr

// market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc
Settings settingService = Settings();
