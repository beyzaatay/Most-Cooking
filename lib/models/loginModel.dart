class LoginModel {
  String? mail;
  String? password;

  LoginModel({this.mail, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    //Jsondan nesne oluşturma
    return LoginModel(mail: json["mail"], password: json["password"]);
  }
  Map<String, dynamic> toJson() {
    //Nesneyi jsona dönüştürma
    return {
      'mail': mail,
      'password': password,
    };
  }
}
