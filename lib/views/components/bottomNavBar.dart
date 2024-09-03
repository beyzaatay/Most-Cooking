import 'package:flutter/material.dart';
import 'package:most_cooking/views/pages/HomePage.dart';
import 'package:most_cooking/views/pages/MyRecipes.dart';
import 'package:most_cooking/views/pages/Profile.dart';
import 'package:most_cooking/utils/renkler.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int) onTabSelected;

  const BottomNavBar({super.key, required this.onTabSelected});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Recipes'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        widget.onTabSelected(index);
      },
      backgroundColor: Colors.amber, // Arka plan rengi
      selectedItemColor: Turuncu,
      unselectedItemColor: Colors.grey,
    );
  }
}
