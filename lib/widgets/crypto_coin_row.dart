import 'package:flutter/material.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';
import 'package:rate_master_flutter/utilities/constants.dart';

class CryptoCoinRow extends StatelessWidget {
  final CryptoCurrency coin;

  const CryptoCoinRow({required this.coin, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          // Rank
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${coin.rank}',
                style: kLabelTextStyle,
              ),
            ),
          ),
          // Logo
          Expanded(
            flex: 1,
            child: Image.network(
              coin.getIconUrl(),
              width: 30.0,
              height: 30.0,
            ),
          ),
          // Name
          Expanded(
            flex: 2,
            child: Text(
              '${coin.symbol}',
              style: kCoinNameTextStyle.copyWith(
                fontSize: 17.0
              ),
            ),
          ),
          // Price
          Expanded(
            flex: 2,
            child: Text(
              '\$${coin.price?.toDouble().toStringAsFixed(2)}',
              style: kCoinPriceTextStyle.copyWith(
                color: Colors.lightGreen,
                fontSize: 15.0
              ),
            ),
          ),
          // Change Percent
          Expanded(
            flex: 2,
            child: Text(
              '${coin.changePercent?.toDouble().toStringAsFixed(2)}\%',
              style: kCoinChangePercentTextStyle.copyWith(
                color: coin.getPercentColor()
              ),
            ),
          )
        ],
      ),
    );
  }
}
