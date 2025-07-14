import '../services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CryptoCurrency {
  final String _apiKey = dotenv.env['COINCAP_API_KEY'] ?? '';


}