import 'package:intl/intl.dart';

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

  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
}

// market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc
Settings settingService = Settings();
