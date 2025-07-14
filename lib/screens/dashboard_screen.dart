import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';
import 'package:rate_master_flutter/services/crypto_card.dart';

class DashboardScreen extends StatefulWidget {
  final List<CryptoCurrency> topCoins;

  const DashboardScreen({required this.topCoins, super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.0,
    keepPage: true
  );

  CryptoCurrency cryptoCurrency = CryptoCurrency();

  @override
  void initState() {
    super.initState();
    updateUI(widget.topCoins);
  }

  void updateUI(dynamic cryptoCurrencyData) {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20.0
                ),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.currency_exchange,
                  size: 20.0
                ),
                label: 'Convert'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 20.0
                ),
                label: 'Settings'
            )
          ]
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Text(
                'Top Crypto Currencies'
              ),
              SizedBox(
                width: 200,
                height: 300,
                child: Center(
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    reverse: false,
                    pageSnapping: true,
                    children: widget.topCoins.map((coin) {
                      return Center(
                        child: SizedBox(
                          width: 200,
                          height: 300,
                          child: CryptoCard(coin: coin),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          )
      )
    );
  }
}
