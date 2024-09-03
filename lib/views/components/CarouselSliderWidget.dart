import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1506368249639-73a05d6f6488?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y29va2luZ3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1506368249639-73a05d6f6488?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y29va2luZ3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1506368249639-73a05d6f6488?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y29va2luZ3xlbnwwfHwwfHx8MA%3D%3D',
    "https://images.unsplash.com/photo-1556908153-1055164fe2df?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGNvb2tpbmd8ZW58MHx8MHx8fDA%3D"
  ];

  int activeCarousel = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300, // Slider'ın genişliğini artırdım
              height: 150, // Slider'ın yüksekliğini artırdım
              child: CarouselSlider(
                items: imgList
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20.0), // Resimlere kenar yuvarlama ekledim
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Image.network(item, fit: BoxFit.cover),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeCarousel = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => setState(() => activeCarousel = entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeCarousel == entry.key
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
