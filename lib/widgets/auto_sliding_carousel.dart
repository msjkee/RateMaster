import 'dart:async';
import 'package:flutter/material.dart';
import 'crypto_card.dart';
import '../services/crypto_currency.dart';

class AutoSlidingCarousel extends StatefulWidget {
  final List<CryptoCurrency> coins;
  final Duration interval;
  final double viewportFraction;
  final PageController controller;

  AutoSlidingCarousel({
    Key? key,
    required this.coins,
    required this.controller,
    this.interval = const Duration(seconds: 3),
    this.viewportFraction = 1,
  }) : super(key: key);

  @override
  State<AutoSlidingCarousel> createState() => _AutoSlidingCarouselState();
}

class _AutoSlidingCarouselState extends State<AutoSlidingCarousel> {
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.interval, (_) {
      final next = (_currentPage + 1) % widget.coins.length;
      widget.controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
      _currentPage = next;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      itemCount: widget.coins.length,
      itemBuilder: (context, i) {
        final coin = widget.coins[i];
        return Center(
          child: SizedBox(
            width: 220,
            height: 340,
            child: CryptoCard(coin: coin),
          ),
        );
      },
    );
  }
}
