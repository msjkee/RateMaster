import 'package:flutter/material.dart';
import 'package:rate_master_flutter/widgets/bottom_nav_bar.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        dashboardIsSelected: false,
        convertIsSelected: true,
        settingsIsSelected: false,
      ),
    );
  }
}
