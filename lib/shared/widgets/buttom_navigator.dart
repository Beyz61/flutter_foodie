import 'package:flutter/material.dart';
import 'package:foodie_screen/feautures/discover/screens/spot_screen.dart';
import 'package:foodie_screen/feautures/favorite/screens/favorit_screen.dart';
import 'package:foodie_screen/feautures/feed/screens/feed_screen.dart';
import 'package:foodie_screen/feautures/profile/screens/settings_screen.dart'; 

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
      const SpotScreen(),
      const SettingsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
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
          BottomNavigationBarItem(icon: Icon(Icons.public), label: "Entdecken"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

