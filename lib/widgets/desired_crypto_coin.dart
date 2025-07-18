import 'package:flutter/material.dart';
import 'package:rate_master_flutter/services/crypto_currency.dart';
import 'package:rate_master_flutter/utilities/constants.dart';

class DesiredCryptoCoin extends StatelessWidget {
  final CryptoCurrency coin;

  const DesiredCryptoCoin({required this.coin, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        CircleAvatar(
          child: Image.network(
            coin.getIconUrl(),
            width: 100.0,
            height: 100.0
          )
        ),
        Text(
          '${coin.name}',
          style: kCoinNameTextStyle,
          textAlign: TextAlign.center
        ),
        Text(
          '${coin.rank}',
          style: kLabelTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          '\$${coin.price?.toDouble().toStringAsFixed(2)}',
          style: kCoinPriceTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          'Supply',
          style: kLabelTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          '${coin.supply?.toDouble()}',
          style: kCoinSupplyTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          '${coin.changePercent?.toDouble().toStringAsFixed(2)}\%',
          textAlign: TextAlign.center,
          style: kCoinChangePercentTextStyle.copyWith(
            color: coin.getPercentColor()
          )
        )
      ],
    );
  }
}
