import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/ai/screens/ai_screen.dart';
import 'package:foodie_screen/feautures/discover/screens/spot_screen.dart';
import 'package:foodie_screen/feautures/favorite/screens/favorit_screen.dart';
import 'package:foodie_screen/feautures/feed/screens/feed_screen.dart';
import 'package:foodie_screen/feautures/profile/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonNavigator extends StatefulWidget {
  const ButtonNavigator({super.key});

  @override
  _ButtonNavigator createState() => _ButtonNavigator();
}

class _ButtonNavigator extends State<ButtonNavigator> {
  int _selectedPage = 0;  
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const FeedScreen(),
      const FavoritScreen(),
      const AIScreen(), 
      const SpotScreen(),
      const SettingsScreen(),
    ];
  }


  Future<void> _saveSelectedPage(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedPage', index); 
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
    _saveSelectedPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 218, 211),
      body: _screens[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 24, 23, 22),
        selectedItemColor: const Color.fromARGB(255, 242, 101, 8),
        unselectedItemColor: const Color.fromARGB(255, 225, 175, 131),
        currentIndex: _selectedPage,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, 
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Heute"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favoriten"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome_outlined), label: "AI"), 
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "Entdecken"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),

        ],
      ),
    );
  }
}

