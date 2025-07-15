import 'package:flutter/material.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';
import 'package:rate_master_flutter/services/auto_sliding_carousel.dart';
import 'package:rate_master_flutter/utilities/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardScreen extends StatefulWidget {
  final List<CryptoCurrency> topCoins;

  const DashboardScreen({required this.topCoins, super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  CryptoCurrency cryptoCurrency = CryptoCurrency();
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: 0,
        keepPage: true,
        viewportFraction: 1
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 25.0,
                  color: Colors.black87
                ),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.currency_exchange,
                  size: 25.0,
                  color: Colors.black87
                ),
                label: 'Convert'
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 25.0,
                  color: Colors.black87,
                ),
                label: 'Settings'
            )
          ],
        selectedLabelStyle: TextStyle(
          fontSize: 17.0,
          fontFamily: 'Oswald',
          fontWeight: FontWeight.w900,
          color: Colors.black87
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Oswald',
          fontWeight: FontWeight.w600,
          color: Colors.black87
        ),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Container(
                padding: EdgeInsets.all(40),
                child: TextField(
                  style: kTextFieldTextStyle,
                  decoration: kTextFieldInputDecoration.copyWith(
                    fillColor: Colors.grey.shade300,
                  )
                ),
              ),
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
                  child: AutoSlidingCarousel(
                    controller: _pageController,
                    viewportFraction: 1,
                    interval: const Duration(seconds: 3),
                    coins: widget.topCoins
                  )
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.topCoins.length,
                  effect: SlideEffect(
                    dotColor: Colors.grey.shade400,
                    activeDotColor: Colors.black87
                  ),
                ),
              )
            ],
          )
      )
    );
  }
}
