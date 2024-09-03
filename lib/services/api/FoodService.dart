import 'dart:convert';

import 'package:most_cooking/models/AddFoodModel.dart';
import 'package:http/http.dart' as http;
import 'package:most_cooking/models/FoodList_model.dart';
import 'package:most_cooking/services/endpoints.dart';

class FoodService {
  //food ekleme
  Future<bool> addFood(AddFoodModel food) async {
    try {
      final response = await http.post(Uri.parse(Endpoints.food),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(food
              .toJson())); //yemek tarifini json formatına dönüştürüp ekliyoruz

      if (response.statusCode == 200) {
        return true;
        //yemek tarifi eklendi olarak true döndürüyoruz
      } else {
        print('tarif eklenemedi. status code: ${response.statusCode}');
        print('Response body : ${response.body}');
        return false;
      }
    } catch (e) {
      // İstek sırasında bir hata oluşursa, hatayı yazdırıyoruz
      print('hata: $e');
      return false;
    }
  }

  //food listeleme
  Future<List<FoodListModel>?> listFood() async {
    try {
      // final token = await TokenService.getToken();
      final response = await http.get(
        Uri.parse(Endpoints.food),
        headers: {
          //'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => FoodListModel.fromJson(item)).toList();
      } else {
        print('Failed to fetch foods. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return null;
    }
  }

  //İDYE GÖRE YEMEK LİSTELEME
  Future<FoodListModel?> getFoodById(int foodId) async {
    try {
      // final token = await TokenService.getToken();
      final response = await http.get(
        Uri.parse(Endpoints.FoodList + '/$foodId'),
        headers: {
          //'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return FoodListModel.fromJson(data);
      } else {
        print('Failed to fetch food. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception occurred: $e');
      return null;
    }
  }

  //TÜM YEMEKLERİ İDYE GÖRE GETİRİCEK BUNU MYRECİPES DE KULLANDIM
  Future<List<Map<String, dynamic>>> getAllFoods() async {
    final response = await http.get(Uri.parse(Endpoints.food));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception(
          'Tarifler getirilemedi, status code: ${response.statusCode}');
    }
  }
}
