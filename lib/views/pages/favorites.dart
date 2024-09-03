import 'package:flutter/material.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/components/FoodCard.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Arkaplan,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Favorilerim",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: Turuncu),
            ),
          ),
          // FoodCard(),
        ],
      ),
    );
    ;
  }
}
