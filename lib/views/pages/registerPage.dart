import 'package:flutter/material.dart';
import 'package:most_cooking/models/register_model.dart';
import 'package:most_cooking/services/api/register_service.dart';
import 'package:most_cooking/views/pages/loginPage.dart';
import 'package:most_cooking/utils/renkler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final RegisterService _userService = RegisterService();
  bool obscurePassword = true;

  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen doğum tarihinizi giriniz';
    }
    try {
      // Tarih formatını kontrol et
      List<String> parts = value.split('-');
      if (parts.length != 3) {
        throw FormatException('Invalid date format');
      }
      DateTime(
        int.parse(parts[0]), // Yıl
        int.parse(parts[1]), // Ay
        int.parse(parts[2]), // Gün
      );
    } catch (e) {
      return 'Geçerli bir tarih formatı giriniz (YYYY-MM-DD)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    final double screenHeight = screenSize.size.height;
    final double screenWidth = screenSize.size.width;

    return Scaffold(
      backgroundColor: Turuncu,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                SizedBox(
                  height: screenHeight / 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: screenWidth / 15, left: screenWidth / 15),
                    child: SizedBox(
                        width: 200,
                        height: 100,
                        child:
                            Container(child: Image.asset("images/logo.png"))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Adınızı yazınız",
                        hintStyle: TextStyle(color: Turuncu),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Turuncu,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen adınızı giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: TextFormField(
                    controller: _surNameController,
                    decoration: InputDecoration(
                        hintText: "Soyadınızı yazınız",
                        hintStyle: TextStyle(color: Turuncu),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Turuncu,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen soyadınızı giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        hintText: "Telefon numaranızı yazınız",
                        hintStyle: TextStyle(color: Turuncu),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Turuncu,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen telefon numaranızı giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: TextFormField(
                    controller: _mailController,
                    decoration: InputDecoration(
                        hintText: "E-Mailinizi yazınız",
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen e-posta adresinizi giriniz';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Geçerli bir e-posta adresi giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: TextFormField(
                    controller: _birthController,
                    decoration: InputDecoration(
                        hintText: "Doğum tarihinizi giriniz (YYYY-MM-DD)",
                        hintStyle: TextStyle(color: Turuncu),
                        prefixIcon: Icon(
                          Icons.date_range,
                          color: Turuncu,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        )),
                    validator: _validateDate,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Şifre",
                      hintStyle: TextStyle(color: Turuncu),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Turuncu,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            color: Turuncu,
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen şifrenizi giriniz';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Turuncu),
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.white, width: 1.0)),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final name = _nameController.text;
                      final surName = _surNameController.text;
                      final phone = _phoneController.text;
                      final mail = _mailController.text;
                      final password = _passwordController.text;
                      final birth = _birthController.text;

                      // Tarih formatını kontrol et ve dönüştür
                      DateTime? birthDate;
                      try {
                        List<String> parts = birth.split('-');
                        if (parts.length == 3) {
                          birthDate = DateTime(
                            int.parse(parts[0]), // Yıl
                            int.parse(parts[1]), // Ay
                            int.parse(parts[2]), // Gün
                          );
                        } else {
                          throw FormatException('Invalid date format');
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Geçerli bir tarih formatı giriniz (YYYY-MM-DD).'),
                          ),
                        );
                        return;
                      }

                      String isoBirthDate = birthDate.toUtc().toIso8601String();

                      var newUser = AddUserDto(
                        name: name,
                        surName: surName,
                        phone: phone,
                        mail: mail,
                        password: password,
                        succes: true,
                        birth: isoBirthDate,
                        message: "dddd",
                      );

                      try {
                        var success = await _userService.createUser(newUser);

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Kullanıcı başarıyla oluşturuldu'),
                            ),
                          );
                          Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Kullanıcı oluşturulamadı'),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Bir hata oluştu: $e'),
                          ),
                        );
                        print('Exception: $e');
                      }
                    }
                  },
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Hesabın Varsa Giriş Yap",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
