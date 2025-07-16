import 'package:flutter/material.dart';
import 'package:rate_master_flutter/screens/dashboard_screen.dart';
import 'package:rate_master_flutter/widgets/bottom_nav_bar.dart';

class ConvertScreen extends StatefulWidget {
  const ConvertScreen({super.key});

  @override
  State<ConvertScreen> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
