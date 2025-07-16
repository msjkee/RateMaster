import 'package:flutter/material.dart';
import 'package:rate_master_flutter/widgets/bottom_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        dashboardIsSelected: false,
        convertIsSelected: false,
        settingsIsSelected: true,
      ),
    );
  }
}
