import 'package:flutter/material.dart';
import 'package:most_cooking/views/components/Appbar.dart';
import 'package:most_cooking/views/components/bottomNavBar.dart';
import 'package:most_cooking/views/pages/HomePage.dart';
import 'package:most_cooking/views/pages/MyRecipes.dart';
import 'package:most_cooking/views/pages/Profile.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/pages/favorites.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Arkaplan,
      appBar: Appbar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          MyRecipes(),
          Favorites(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        onTabSelected: _onTabSelected,
      ),
    );
  }
}
