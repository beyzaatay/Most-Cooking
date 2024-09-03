import 'dart:convert';

import 'package:most_cooking/models/loginModel.dart';
import 'package:http/http.dart' as http;
import 'package:most_cooking/services/endpoints.dart';

class LoginService {
  Future<String> login(LoginModel loginModel) async {
    // Login işlemini gerçekleştiren asenkron bir fonksiyon
    final response = await http.post(
        //post isteği yaptık ve yanıt bekliyoruz
        Uri.parse(Endpoints.login),
        headers: <String, String>{
          'Content-Type':
              'application/json; charset=UTF-8', //json formatında veri gönderildi
        },
        body: jsonEncode(loginModel.toJson()));

    if (response.statusCode == 200) {
      return response.body; // Return the response body as a string
    } else {
      return 'Login failed: ${response.statusCode} - ${response.body}';
    }
  }
}
