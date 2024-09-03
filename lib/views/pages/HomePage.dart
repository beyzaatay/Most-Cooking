import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/components/CarouselSliderWidget.dart';
import 'package:most_cooking/views/components/FoodCard.dart';
import 'package:most_cooking/views/components/categoriesSlider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Arkaplan,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSliderWidget(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: SearchBar(
                    hintText: "Yemek Tarifi yaz ve ara",
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Turuncu,
              )
            ],
          ),
          CategoriesSlider(),
          FoodCard(),
        ],
      ),
    );
  }
}
