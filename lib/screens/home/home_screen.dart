import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:pariwisata_indonesia/screens/home/subscreens/home/home.dart';
import 'package:pariwisata_indonesia/screens/home/subscreens/travel/travel.dart';
import 'package:pariwisata_indonesia/screens/home/subscreens/settings/settings.dart';
import 'package:pariwisata_indonesia/screens/home/subscreens/search/info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Menambahkan label untuk setiap icon navigasi
  List<IconData> navIcons = [
    Icons.home_rounded, // Menggunakan icon rounded untuk tampilan lebih modern
    Icons.explore_rounded, // Mengganti search dengan explore yang lebih sesuai
    Icons.card_travel_rounded,
    Icons.person_rounded, // Mengganti settings dengan profile
  ];

  // Menambahkan label untuk bottom navigation
  final List<String> navLabels = [
    'Beranda',
    'Jelajah',
    'Wisata',
    'Profil',
  ];

  List<Widget> listSubscreen = [
    Home(),
    // Menggunakan placeholder yang lebih informatif
    TravelScreen(),
    InfoScreen(),
    SettingsScreen(),


  ];

  int activeSubscreens = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Menambahkan animasi pergantian halaman
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: listSubscreen[activeSubscreens],
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
            ),
          ],
        ),
        child: AnimatedBottomNavigationBar.builder(
          itemCount: navIcons.length,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  navIcons[index],
                  size: 24,
                  color: isActive ? Colors.white : Colors.white70,
                ),
                const SizedBox(height: 4),
                Text(
                  navLabels[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: isActive ? Colors.white : Colors.white70,
                  ),
                ),
              ],
            );
          },
          activeIndex: activeSubscreens,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          onTap: (index) => setState(() => activeSubscreens = index),
          backgroundColor: Color(0xFF7C0A30),
          gapLocation: GapLocation.none,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          elevation:
              0, // Menghilangkan elevation default karena sudah menggunakan shadow
        ),
      ),
    );
  }
}
