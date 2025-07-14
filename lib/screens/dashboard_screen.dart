import 'package:flutter/material.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';

class DashboardScreen extends StatefulWidget {
  final dynamic cryptoCurrency;

  const DashboardScreen({this.cryptoCurrency ,super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  CryptoCurrency cryptoCurrency = CryptoCurrency();

  String? name;
  String? id;
  String? symbol;
  double? price;
  double? supply;

  @override
  void initState() {
    super.initState();
    updateUI(widget.cryptoCurrency);
  }

  void updateUI(dynamic cryptoCurrencyData) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView()
      )
    );
  }
}
