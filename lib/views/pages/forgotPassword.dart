import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:most_cooking/utils/renkler.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _LoginPageState();
}

class _LoginPageState extends State<forgotPassword> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    final double screenHeight = ScreenSize.size.height;
    final double screenWidth = ScreenSize.size.width;
    return Scaffold(
      backgroundColor: Turuncu,
      body: Column(
        children: [
          Spacer(),
          SizedBox(
            height: screenHeight / 4,
            child: Padding(
              padding: EdgeInsets.only(
                  right: screenWidth / 15, left: screenWidth / 15),
              child: Image.asset("images/logo.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Kayıtlı E-Mail Adresinizi giriniz",
                  hintStyle: TextStyle(color: Turuncu),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Turuncu,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Turuncu),
              side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.white, width: 1.0)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Gönder",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
