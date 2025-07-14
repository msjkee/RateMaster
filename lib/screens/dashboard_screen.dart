import 'package:flutter/material.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';
import 'package:rate_master_flutter/services/crypto_card.dart';
import 'package:rate_master_flutter/utilities/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
              Center(
                child: Text(
                  'Top Crypto Currencies',
                  style: kDashboardTopCoinsTextStyle,
                ),
              ),
              SizedBox(
                width: 220,
                height: 400,
                child: Center(
                  child: PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    reverse: false,
                    pageSnapping: true,
                    children: widget.topCoins.map((coin) {
                      return Center(
                        child: SizedBox(
                          width: 220,
                          height: 340,
                          child: CryptoCard(coin: coin),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: SlideEffect(
                    //TODO: MAKE A DESIGN FOR SLIDE EFFECT
                  ),
                ),
              )
            ],
          )
      )
    );
  }
}
