import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:most_cooking/models/loginModel.dart';
import 'package:most_cooking/services/api/login_service.dart';
import 'package:most_cooking/views/pages/Anasayfa.dart';
import 'package:most_cooking/views/pages/HomePage.dart';
import 'package:most_cooking/views/pages/forgotPassword.dart';
import 'package:most_cooking/views/pages/registerPage.dart';
import 'package:most_cooking/utils/renkler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final _formKey = GlobalKey<FormState>(); // Form için bir anahtar tanımlanır
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginService _loginService = LoginService();
  String? email, password; //form verilerini tutacak değişkenler
  bool obscurePassword = true;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      // Form doğrulama
      final mail = _mailController.text;
      final password = _passwordController.text;

      if (mail.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email and password are required")),
        );
        return;
      }

      final loginDto = LoginModel(mail: mail, password: password);
      await _loginService.login(loginDto).then((responseBody) {
        if (responseBody.contains("Giriş başarılı")) {
          // Login successful, navigate to Anasayfa
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Anasayfa()));
        } else {
          // Login failed, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Böyle bir kayıt bulunamıyor")),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    final double screenHeight = ScreenSize.size.height;
    final double screenWidth = ScreenSize.size.width;
    return Scaffold(
      backgroundColor: Turuncu,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              SizedBox(
                height: screenHeight / 4,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: screenWidth / 15, left: screenWidth / 15),
                  child: Image.asset("images/logo.png"),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _mailController,
                  decoration: InputDecoration(
                      hintText: "Mailinizi giriniz..",
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
                  autovalidateMode: AutovalidateMode
                      .onUserInteraction, //kullanıcı etkileşimiye otomatik doğrulama
                  onChanged: (value) {
                    _mailController.text = value;
                  },
                  validator: (value) {
                    if (!EmailValidator.validate(value!))
                      return "Geçerli bir eposta giriniz!";
                    if (value == null || value.isEmpty)
                      return "Bu alan boş geçilemez!";
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: obscurePassword,
                  decoration: InputDecoration(
                    hintText: " Şifrenizi giriniz..",
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    _passwordController.text = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "Bu alan boş geçilemez!";

                    if (value.length < 3)
                      return "3 karakterden küçük değer girilemez!";
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forgotPassword()));
                    },
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
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
                onPressed: () {
                  _login();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Anasayfa()));
                },
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text(
                  "Kayıt Ol!",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth / 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Anasayfa()));
                  //hommepage yönlendirme
                },
                child: Text(
                  "kayıt olmadan devam et",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
