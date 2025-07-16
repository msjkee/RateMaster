import 'package:flutter/material.dart';
import 'package:rate_master_flutter/screens/convert_screen.dart';
import 'package:rate_master_flutter/screens/dashboard_screen.dart';
import 'package:rate_master_flutter/screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {

  const BottomNavBar({
    super.key
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        padding: EdgeInsets.all(20),
        color: Colors.teal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              // Dashboard
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()))
                      .then((context) {
                        setState(() {

                        });
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Icon(
                        Icons.home,
                        size: 25.0,
                        color: Colors.black87
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              ),

              // Convert
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConvertScreen())
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Icon(
                          Icons.currency_exchange,
                          size: 25.0,
                          color: Colors.black87
                      ),
                      Text(
                        'Convert',
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700
                        )
                      )
                    ],
                  )
              ),

              // Settings
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsScreen())
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Icon(
                          Icons.settings,
                          size: 25.0,
                          color: Colors.black87
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700
                        )
                      )
                    ],
                  )
              )
            ]
        )
    );
  }
}
