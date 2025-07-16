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
      bottomNavigationBar: BottomNavBar(),
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

//TODO: NAVIGATION LOGIC ***
//TODO: DESIGN BOTTOM NAV BAR (HEIGHT, ACTIVE COLORS, DISABLED COLORS) ***
//TODO: SEARCH LOGIC (CRYPTO AND CURRENCY) *DASHBOARD SCREEN, I GUESS*
//TODO: SETTINGS PAGE
//TODO: CONVERT PAGE
//TODO: DESIGN

// BottomNavigationBar(
//   items: <BottomNavigationBarItem>[
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.home,
//         size: 25.0,
//         color: Colors.black87,
//       ),
//       label: 'Home',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.currency_exchange,
//         size: 25.0,
//         color: Colors.black87,
//       ),
//       label: 'Convert',
//     ),
//     BottomNavigationBarItem(
//       icon: Icon(
//         Icons.settings,
//         size: 25.0,
//         color: Colors.black87,
//       ),
//       label: 'Settings',
//     ),
//   ],
//   selectedLabelStyle: TextStyle(
//     fontSize: 17.0,
//     fontFamily: 'Oswald',
//     fontWeight: FontWeight.w900,
//     color: Colors.black87,
//   ),
//   unselectedLabelStyle: TextStyle(
//     fontSize: 14.0,
//     fontFamily: 'Oswald',
//     fontWeight: FontWeight.w600,
//     color: Colors.black87,
//   ),
// ),
