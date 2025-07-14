import 'package:flutter/material.dart';
import 'crypto_currency.dart';
import 'package:rate_master_flutter/utilities/constants.dart';

class CryptoCard extends StatelessWidget {
  final CryptoCurrency coin;
  const CryptoCard({required this.coin ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Image.network(
              coin.getIconUrl(),
              width: 100.0,
              height: 100.0
            ),
            Text(
              '${coin.name}',
              style: kCoinNameTextStyle
            ),
            Text(
              '${coin.price}',
              style: kCoinPriceTextStyle
            ),
            Text(
              '${coin.supply}',
              style: kCoinSupplyTextStyle
            )
          ],
        )
      )
    );
  }
}
