class AddUserDto {
/*
{
  "name": "string",
  "surName": "string",
  "phone": "string",
  "mail": "string",
  "password": "string",
  "message": "string",
  "succes": true,
  "birth": "2024-07-22T12:20:32.316Z"
} 
*/

  String? name;
  String? surName;
  String? phone;
  String? mail;
  String? password;
  String? message;
  bool? succes;
  String? birth;

  AddUserDto({
    this.name,
    this.surName,
    this.phone,
    this.mail,
    this.password,
    this.message,
    this.succes,
    this.birth,
  });
  AddUserDto.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    surName = json['surName']?.toString();
    phone = json['phone']?.toString();
    mail = json['mail']?.toString();
    password = json['password']?.toString();
    message = json['message']?.toString();
    succes = json['succes'];
    birth = json['birth']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['surName'] = surName;
    data['phone'] = phone;
    data['mail'] = mail;
    data['password'] = password;
    data['message'] = message;
    data['succes'] = succes;
    data['birth'] = birth;
    return data;
  }
}
