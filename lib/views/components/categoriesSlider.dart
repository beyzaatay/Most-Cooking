import 'package:flutter/material.dart';
import 'package:most_cooking/utils/renkler.dart';

class CategoriesSlider extends StatefulWidget {
  const CategoriesSlider({super.key});

  @override
  State<CategoriesSlider> createState() => _CategoriesSliderState();
}

class _CategoriesSliderState extends State<CategoriesSlider> {
  var ulkeler = [
    "tatlı",
    "ana yemek",
    "Aperatifler",
    "başlangıç",
    "çorba",
    "italy"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ulkeler.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Kategori detaya geçiş:
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetaySayfa(ulkeAdi: "${ulkeler[index]}")));
            },
            child: Card(
              color: Turuncu,
              child: SizedBox(
                width: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        ulkeler[index],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
