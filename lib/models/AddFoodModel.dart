class AddFoodModel {
  String? name;
  String? description;
  int? userId;
  int? categoryId;
  int? star;
  String? foodPhoto;
  String? ownPhoto;
  String? ownname;

  AddFoodModel(
      {this.name,
      this.description,
      this.userId,
      this.categoryId,
      this.star,
      this.foodPhoto,
      this.ownPhoto,
      this.ownname});

  AddFoodModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    userId = json['userId'];
    categoryId = json['categoryId'];
    star = json['star'];
    foodPhoto = json['foodPhoto'];
    ownPhoto = json['ownPhoto'];
    ownname = json['ownname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['userId'] = this.userId;
    data['categoryId'] = this.categoryId;
    data['star'] = this.star;
    data['foodPhoto'] = this.foodPhoto;
    data['ownPhoto'] = this.ownPhoto;
    data['ownname'] = this.ownname;
    return data;
  }
}
