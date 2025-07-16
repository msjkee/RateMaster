import 'package:flutter/material.dart';
import 'package:rate_master_flutter/screens/convert_screen.dart';
import 'package:rate_master_flutter/screens/dashboard_screen.dart';
import 'package:rate_master_flutter/screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  bool dashboardIsSelected;
  bool convertIsSelected;
  bool settingsIsSelected;

  BottomNavBar({
    required this.dashboardIsSelected,
    required this.convertIsSelected,
    required this.settingsIsSelected,
    super.key
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        padding: EdgeInsets.only(bottom: 12.0),
        color: Colors.black87,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              // Dashboard
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dashboardIsSelected = true;
                    widget.convertIsSelected = false;
                    widget.settingsIsSelected = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen())
                  );
                },
                child: Container(
                  height: widget.dashboardIsSelected ? 75.0 : 60.0,
                  width: widget.dashboardIsSelected ? 75.0 : 60.0,
                  decoration: BoxDecoration(
                    color: widget.dashboardIsSelected ? Colors.black : null,
                    shape: BoxShape.circle
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Icon(
                            Icons.home,
                            size: widget.dashboardIsSelected ? 27.0 : 20.0,
                            color: Colors.white
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: widget.dashboardIsSelected ? 14.0 : 12.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Convert
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dashboardIsSelected = false;
                    widget.convertIsSelected = true;
                    widget.settingsIsSelected = false;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConvertScreen())
                  );
                },
                child: Container(
                  height: widget.convertIsSelected ? 75.0 : 60.0,
                  width: widget.convertIsSelected ? 75.0 : 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.convertIsSelected ? Colors.black : null
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Icon(
                              Icons.currency_exchange,
                              size: widget.convertIsSelected ? 27.0 : 20.0,
                              color: Colors.white
                          ),
                          Text(
                            'Convert',
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: widget.convertIsSelected ? 14.0 : 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            )
                          )
                        ],
                      )
                  ),
                ),
              ),

              // Settings
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dashboardIsSelected = false;
                    widget.convertIsSelected = false;
                    widget.settingsIsSelected = true;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen())
                  );
                },
                child: Container(
                  height: widget.settingsIsSelected ? 75.0 : 60.0,
                  width: widget.settingsIsSelected ? 75.0 : 60.0,
                  decoration: BoxDecoration(
                    color: widget.settingsIsSelected ? Colors.black : null,
                    shape: BoxShape.circle
                  ),
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Icon(
                              Icons.settings,
                              size: widget.settingsIsSelected ? 27.0 : 20.0,
                              color: Colors.white
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: widget.settingsIsSelected ? 14.0 : 12.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            )
                          )
                        ],
                      )
                  ),
                ),
              )
            ]
        )
    );
  }
}
