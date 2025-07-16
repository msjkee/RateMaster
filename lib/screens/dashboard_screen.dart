import 'package:flutter/material.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';
import 'package:rate_master_flutter/widgets/auto_sliding_carousel.dart';
import 'package:rate_master_flutter/utilities/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:rate_master_flutter/widgets/bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<CryptoCurrency>? topCoins;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: 0,
        keepPage: true,
        viewportFraction: 1
    );
    loadTopCryptoCurrencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  Future<void> loadTopCryptoCurrencies() async {
    CryptoCurrency cryptoCurrency = CryptoCurrency();
    final list = await cryptoCurrency.fetchTopCryptos(5);
    setState(() {
      topCoins = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (topCoins == null) {
      return kLoadingSpinKit;
    }

    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        dashboardIsSelected: true,
        convertIsSelected: false,
        settingsIsSelected: false,
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Text(
                'Dive into the World of Currencies',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
                )
              ),
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
                    coins: topCoins!
                  )
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: topCoins!.length,
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


//TODO: MAKE A BOTTOM NAV BAR (MAKE IT AS CONTAINERS) *CUSTOM WIDGET* DONE
//TODO: NAVIGATION LOGIC *** DONE
//TODO: DESIGN BOTTOM NAV BAR (HEIGHT, ACTIVE COLORS, DISABLED COLORS) *** DONE, BUT NEED TO DIVE INTO PADDINGS, MARGINS AND HEIGHT-WIDTH PARAMETERS OF CONTAINERS

//TODO: SEARCH LOGIC (CRYPTO AND CURRENCY) *DASHBOARD SCREEN, I GUESS*
//TODO: SETTINGS PAGE
//TODO: CONVERT PAGE
//TODO: DESIGN
