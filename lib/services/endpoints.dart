class Endpoints {
  Endpoints._(); //sınfın dışarıdan örneklenmesini engellemek için
  static const String baseUrl = "http://104.247.163.183:1414/api";

  static const String login = '$baseUrl/User/login';

  static const String register = '$baseUrl/User/register';

  static const String food = '$baseUrl/Food';

  static const String User = '$baseUrl/User';
  static const String FoodList = '$baseUrl/Food';

  static const int receiveTimeout =
      15000; // sunucudan yanıtın alınması gereken max süre
  static const int connectionTimeout = 15000; //sunucuya bağlanma süresi
}
