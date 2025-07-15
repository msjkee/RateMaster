import 'package:flutter/material.dart';

const kCoinNameTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Noto_Serif'
);

const kCoinPriceTextStyle = TextStyle(
  fontSize: 17.0,
  fontWeight: FontWeight.w800,
  fontFamily: 'Noto_Serif',
  color: Colors.green
);

const kCoinSupplyTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w600,
  fontFamily: 'Noto_Serif'
);

const kDashboardTopCoinsTextStyle = TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.w900,
    color: Colors.black,
    fontSize: 40.0
);

const kLabelTextStyle = TextStyle(
  fontFamily: 'Noto_Serif',
  fontSize: 15.0,
  fontWeight: FontWeight.w700,
  color: Colors.black
);

const kCoinChangePercentTextStyle = TextStyle(
    fontFamily: 'Noto_Serif',
    fontSize: 18.0,
    fontWeight: FontWeight.w800
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    icon: Icon(
        Icons.find_in_page
    ),
    iconColor: Colors.black87,
    hintText: 'Enter Currency or Cryptocurrency',
    hintStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Noto_Serif',
        fontSize: 15
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(
            color: Colors.black87,
            width: 1.5
        )
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(
            color: Colors.black87,
            width: 2.5
        )
    ),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(
            color: Colors.black54,
            width: 1.5
        )
    )
);

const kTextFieldTextStyle = TextStyle(
    color: Colors.black87,
    fontFamily: 'Noto_Serif',
    fontSize: 20.0,
    fontWeight: FontWeight.w700
);
