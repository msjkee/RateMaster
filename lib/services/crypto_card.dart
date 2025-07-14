import 'package:flutter/material.dart';
import 'crypto_currency.dart';
import 'package:rate_master_flutter/utilities/constants.dart';

class CryptoCard extends StatelessWidget {
  final CryptoCurrency coin;
  const CryptoCard({required this.coin ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0)
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue.withOpacity(0.2),
              child: Image.network(
                coin.getIconUrl(),
                width: 100.0,
                height: 100.0
              ),
            ),
            Text(
              '${coin.name}',
              style: kCoinNameTextStyle,
              textAlign: TextAlign.center
            ),
            SizedBox(height: 8),
            Text(
              'Rank: #${coin.rank}',
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              '\$${coin.price?.toInt()}',
              style: kCoinPriceTextStyle,
              textAlign: TextAlign.center
            ),
            SizedBox(height: 4),
            Text(
              'Supply',
              style: kLabelTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              '${coin.supply?.toInt()}',
              style: kCoinSupplyTextStyle,
              textAlign: TextAlign.center
            )
          ],
        )
      )
    );
  }
}
