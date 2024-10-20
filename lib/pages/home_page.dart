import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'jeepneys_page.dart'; // Import for JeepneysPage
import 'location_page.dart'; // Import for LocationPage
import 'settings_page.dart'; // Import for SettingsPage
import 'account_page.dart';  // Import for AccountPage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.transparent, // Set background color to transparent
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    JeepneysPage(),
    LocationPage(),
    SettingsPage(),
    AccountPage(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 0, 1, 85), const Color.fromARGB(255, 0, 0, 0)!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, const Color.fromARGB(255, 0, 0, 0)!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GNav(
          backgroundColor: Colors.transparent, // Set background to transparent
          color: Colors.white,
          activeColor: Colors.white,
          gap: 8,
          padding: EdgeInsets.all(16),
          tabBackgroundColor: const Color.fromARGB(255, 28, 0, 153)!,
          selectedIndex: _selectedIndex,
          onTabChange: _onTabChange,
          tabs: const [
            GButton(
              icon: Icons.car_crash_rounded,
              text: 'Jeepneys',
            ),
            GButton(
              icon: Icons.pin_drop_rounded,
              text: 'Navigations',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
            GButton(
              icon: Icons.account_circle_rounded,
              text: 'Accounts',
            ),
          ],
        ),
      ),
    );
  }
}
