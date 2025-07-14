import '../services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CryptoCurrency {
  final String _apiKey = dotenv.env['COINCAP_API_KEY'] ?? '';

  String? name;
  String? id;
  String? symbol;
  double? price;
  double? supply;
  String? rank;

  CryptoCurrency({this.name, this.id, this.symbol, this.price, this.supply, this.rank});

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) {
    return CryptoCurrency(
      id:     json['id']     as String,
      rank:   json['rank']   as String,
      name:   json['name']   as String,
      symbol: json['symbol'] as String,
      price:  double.parse(json['priceUsd'] as String),
      supply: double.parse(json['supply'] as String),
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

  String getIconUrl() {
    final symbolLowerCase = symbol?.toLowerCase() ?? '';
    return 'https://static.coincap.io/assets/icons/${symbolLowerCase}@2x.png';
  }
}
