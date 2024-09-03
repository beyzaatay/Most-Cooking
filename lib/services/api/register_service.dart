import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:most_cooking/models/register_model.dart';
import 'package:most_cooking/services/endpoints.dart';

class RegisterService {
  Future<bool> createUser(AddUserDto user) async {
    try {
      final response = await http.post(
        Uri.parse(Endpoints.register),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to create user. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return false;
    }
  }

  Future<List<AddUserDto>?> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse(Endpoints.User),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((user) => AddUserDto.fromJson(user)).toList();
      } else {
        print('Failed to fetch users. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return null;
    }
  }
}
