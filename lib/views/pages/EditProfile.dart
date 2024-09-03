import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:most_cooking/utils/renkler.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Arkaplan,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Turuncu,
        title: const Text(
          "Profili Düzenle",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Adınızı ve Soyadınızı Yazınız",
                      hintStyle: TextStyle(color: Turuncu),
                      prefixIcon: Icon(
                        Icons.badge,
                        color: Turuncu,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Kullanıcı Adınızı Yazınız",
                      hintStyle: TextStyle(color: Turuncu),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Turuncu,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "E-Posta Adresinizi Yazınız",
                      hintStyle: TextStyle(color: Turuncu),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Turuncu,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              SizedBox(
                height: screenSize.size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Turuncu),
                      side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(color: Colors.white, width: 1.0)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Düzenle",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20), // Butonlar arasında boşluk
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Turuncu),
                      side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(color: Colors.white, width: 1.0)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "İptal",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
