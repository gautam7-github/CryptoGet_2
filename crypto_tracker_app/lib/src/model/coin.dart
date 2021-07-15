class Coin {
  String? symbol;
  String? name;
  String? image;
  dynamic currentPrice;
  int? marketCap;
  int? marketCapRank;
  dynamic high24h;
  dynamic low24h;
  dynamic priceChange24h;
  dynamic priceChangePercentage24h;
  dynamic ath;
  dynamic athChangePercentage;
  Coin({
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.ath,
    required this.athChangePercentage,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      symbol: json['symbol'],
      name: json['name'],
      image: json['image'],
      currentPrice: json['current_price'],
      marketCap: json['market_cap'],
      marketCapRank: json['market_cap_rank'],
      high24h: json['high_24h'],
      low24h: json['low_24h'],
      priceChange24h: json['price_change_24h'],
      priceChangePercentage24h: json['price_change_percentage_24h'],
      ath: json['ath'],
      athChangePercentage: json['ath_change_percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['image'] = this.image;
    data['current_price'] = this.currentPrice;
    data['market_cap'] = this.marketCap;
    data['market_cap_rank'] = this.marketCapRank;
    data['high_24h'] = this.high24h;
    data['low_24h'] = this.low24h;
    data['price_change_24h'] = this.priceChange24h;
    data['price_change_percentage_24h'] = this.priceChangePercentage24h;
    data['ath'] = this.ath;
    data['ath_change_percentage'] = this.athChangePercentage;
    return data;
  }
}

List<Coin> coinList = [];
