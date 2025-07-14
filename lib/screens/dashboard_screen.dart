import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Expanded(
                  child: Center(
                    child: Text(
                      'CryptoCurrency icon'
                    ),
                  ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Description'
                  ),
                )
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Rate of currency'
                  ),
                )
              )
            ]
          )
      )
    );
  }
}
