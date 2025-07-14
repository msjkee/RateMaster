import '../services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CryptoCurrency {
  final String _apiKey = dotenv.env['COINCAP_API_KEY'] ?? '';

  String? name;
  String? id;
  String? symbol;
  double? price;
  double? supply;

  CryptoCurrency({this.name, this.id, this.symbol, this.price, this.supply});

  Future<dynamic> fetchTopCryptos(String limit) async {
    final uri = Uri.https(
      'rest.coincap.io',
      '/v3/assets',
      {
        'limit': limit,
        'apiKey': _apiKey
      }
    );

    var cryptoData = await NetworkHelper(url: uri.toString()).getData();
    return cryptoData;
  }

  String getIconUrl() {
    return 'https://static.coincap.io/assets/icons/$symbol@2x.png';
  }
}
