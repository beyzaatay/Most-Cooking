import 'package:flutter/material.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/pages/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Turuncu)),

      home:
          SplashScreen1(), // Başlangıç ekranı olarak SplashScreen'i ayarlıyoruz
    );
  }
}
