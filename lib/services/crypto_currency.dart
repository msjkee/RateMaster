import '../services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

class CryptoCurrency {
  final String _apiKey = dotenv.env['COINCAP_API_KEY'] ?? '';

  String? name;
  String? id;
  String? symbol;
  double? price;
  double? supply;
  String? rank;
  double? changePercent;

  CryptoCurrency({
    this.name,
    this.id,
    this.symbol,
    this.price,
    this.supply,
    this.rank,
    this.changePercent
  });

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      id:     json['id']     as String,
      rank:   json['rank']   as String,
      name:   json['name']   as String,
      symbol: json['symbol'] as String,
      price:  double.parse(json['priceUsd'] as String),
      supply: double.parse(json['supply'] as String),
      changePercent: double.parse(json['changePercent24Hr'] as String)
    );
  }

  Future<dynamic> fetchTopCryptos(int limit) async {
    final uri = Uri.https(
      'rest.coincap.io',
      '/v3/assets',
      {
        'limit': limit.toString(),
        'apiKey': _apiKey
      }
    );

    final cryptoData = await NetworkHelper(url: uri.toString()).getData();
    final List<dynamic> cryptoDataList = cryptoData['data'];

    return cryptoDataList
        .map((e) => CryptoCurrency.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<dynamic> searchForCryptoCoin(String symbol) async {
    final uri = Uri.https(
      'rest.coincap.io',
      '/v3/assets/${symbol.toLowerCase()}',
      {
        'apiKey': _apiKey
      }
    );

    final cryptoData = await NetworkHelper(url: uri.toString()).getData();
    final Map<String, dynamic> json = cryptoData['data'] as Map<String, dynamic>;
    return CryptoCurrency.fromJson(json);
  }

  String getIconUrl() {
    final symbolLowerCase = symbol?.toLowerCase() ?? '';
    return 'https://static.coincap.io/assets/icons/${symbolLowerCase}@2x.png';
  }

  Color getPercentColor() {
    Color color;
    if (changePercent! > 0) {
      color = Colors.green;
      return color;
    } else {
      color = Colors.red;
      return color;
    }
  }
}
