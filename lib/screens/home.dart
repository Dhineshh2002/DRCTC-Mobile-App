import 'package:drctc/screens/profile_screen.dart';
import 'package:drctc/screens/support_screen.dart';
import 'package:drctc/screens/trips_screen.dart';
import 'package:drctc/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/home_appbar.dart';
import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (selectedIndex == 0)
          ? const HomeAppbar()
          : AppBar(
              title: const Center(child: Text('DRCTC')),
              automaticallyImplyLeading: false,
            ),
      body: [
        HomePageScreen(),
        WalletScreen(),
        TripsScreen(),
        ProfileScreen(),
        SupportScreen()
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.wallet), label: "Wallet"),
          NavigationDestination(
              icon: Icon(Icons.airplane_ticket), label: "Trips"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          NavigationDestination(icon: Icon(Icons.headset_mic), label: "Support")
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
