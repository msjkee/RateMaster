import 'package:flutter/material.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';
import 'package:rate_master_flutter/widgets/auto_sliding_carousel.dart';
import 'package:rate_master_flutter/utilities/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:rate_master_flutter/widgets/bottom_nav_bar.dart';
import 'package:rate_master_flutter/widgets/crypto_coin_row.dart';
import 'package:rate_master_flutter/widgets/desired_crypto_coin.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<CryptoCurrency>? topCoins;
  List<CryptoCurrency>? dashboardCoins;
  CryptoCurrency? coin;
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
    loadDashboardCryptoCurrencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Top Coins
  Future<void> loadTopCryptoCurrencies() async {
    CryptoCurrency cryptoCurrency = CryptoCurrency();
    final list = await cryptoCurrency.fetchTopCryptos(5);
    setState(() {
      topCoins = list;
    });
  }

  // Dashboard Coins
  Future<void> loadDashboardCryptoCurrencies() async {
    CryptoCurrency cryptoCurrency = CryptoCurrency();
    final list = await cryptoCurrency.fetchTopCryptos(25);
    setState(() {
      dashboardCoins = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (topCoins == null && dashboardCoins == null) {
      return kLoadingSpinKit;
    }

    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        dashboardIsSelected: true,
        convertIsSelected: false,
        settingsIsSelected: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
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
                    ),
                    onSubmitted: (input) async {
                      final found = await CryptoCurrency().searchForCryptoCoin(input);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(
                                'Information',
                              style: kDashboardTopCoinsTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            actions: <Widget> [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Back'
                                )
                              )
                            ],
                            content: Container(
                                height: 200.0,
                                width: 130.0,
                                child: DesiredCryptoCoin(coin: found)
                            )
                          )
                      );
                    },
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
                ),
                Center(
                  child: Text(
                    'Dashboard',
                    style: kDashboardTopCoinsTextStyle
                  )
                ),
                Container(
                  //padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Text(
                        'Rank',
                        style: kDashboardLabelTextStyle
                      ),
                      Text(
                        'Name',
                        style: kDashboardLabelTextStyle
                      ),
                      Text(
                        'Price',
                        style: kDashboardLabelTextStyle
                      ),
                      Text(
                        'Change 24H',
                        style: kDashboardLabelTextStyle
                      )
                    ],
                  ),
                ),
                // Dashboard Coins
                for (var coin in dashboardCoins!)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                    child: CryptoCoinRow(
                      coin: coin
                    ),
                  ),
              ],
            ),
          )
      )
    );
  }
}

//TODO: MAKE A BOTTOM NAV BAR (MAKE IT AS CONTAINERS) *CUSTOM WIDGET* DONE
//TODO: NAVIGATION LOGIC *** DONE
//TODO: DESIGN BOTTOM NAV BAR (HEIGHT, ACTIVE COLORS, DISABLED COLORS) *** DONE, BUT NEED TO DIVE INTO PADDINGS, MARGINS AND HEIGHT-WIDTH PARAMETERS OF CONTAINERS
//TODO: CRYPTO DASHBOARD *** DONE
//TODO: DESIGN THIS CRYPTO DASHBOARD *** ALMOST DONE (75%), BUT WILL DO DESIGN ON THE FINAL STAGE

//TODO: SEARCH LOGIC (CRYPTO AND CURRENCY) *DASHBOARD SCREEN, I GUESS*
//TODO: SETTINGS PAGE
//TODO: CONVERT PAGE
//TODO: DESIGN

//TODO: DO NOT ALLOW TO SCROLL PAGE VIEW (TOP CURRENCIES) ???