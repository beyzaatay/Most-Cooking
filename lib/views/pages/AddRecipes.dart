import 'package:flutter/material.dart';
import 'package:most_cooking/models/AddFoodModel.dart';
import 'package:most_cooking/services/api/FoodService.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/components/Appbar.dart';

class AddRecipes extends StatefulWidget {
  const AddRecipes({super.key});

  @override
  State<AddRecipes> createState() => _AddRecipesState();
}

class _AddRecipesState extends State<AddRecipes> {
  final _formKey = GlobalKey<FormState>(); //form doğrulama anahtarı
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _starController = TextEditingController();
  final TextEditingController _foodPhotoController = TextEditingController();
  final TextEditingController _ownPhotoController = TextEditingController();
  final TextEditingController _ownNameController = TextEditingController();

  var categories = <String>[];
  String selectedCategory = ""; // Başlangıçta seçili kategori

  @override
  void initState() {
    super.initState();
    categories.addAll(["Tatlı", "Çorba", "Makarna", "Ara Öğün"]);
    selectedCategory =
        categories.first; // Başlangıçta ilk kategori seçili olsun
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context);
    final double screenWidth = screenSize.size.width;

    return Scaffold(
      backgroundColor: Arkaplan,
      appBar: Appbar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tarif Ekle",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Turuncu,
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth,
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Tarif adını yazınız",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Turuncu),
                              ),
                              filled: true,
                              labelText: "Tarif Adı",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Lütfen tarif adını giriniz";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: "Tarif açıklamasını yazınız",
                              labelText: "Açıklama",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Turuncu),
                              ),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Lütfen tarif açıklamasını giriniz";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _starController,
                            decoration: InputDecoration(
                              hintText: "Yıldız sayısı",
                              labelText: "Yıldız",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Turuncu),
                              ),
                              filled: true,
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen yıldız sayısını giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _foodPhotoController,
                            decoration: InputDecoration(
                              hintText: "Yemek fotoğrafı URL'si",
                              labelText: "Yemek Fotoğrafı",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Turuncu),
                              ),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen yemek fotoğrafı URL\'sini giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _ownPhotoController,
                            decoration: InputDecoration(
                              hintText: "Kendi fotoğrafınızın URL'si",
                              labelText: "Kendi Fotoğrafınız",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Turuncu),
                              ),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen kendi fotoğrafınızın URL\'sini giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _ownNameController,
                            decoration: InputDecoration(
                              hintText: "Kendi isminiz",
                              labelText: "Kendi İsminiz",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Turuncu),
                              ),
                              filled: true,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen kendi isminizi giriniz';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Kategori Seç"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton<String>(
                            value: selectedCategory,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              height: 2,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCategory = newValue!;
                              });
                            },
                            items: categories
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Turuncu),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                AddFoodModel newRecipe = AddFoodModel(
                                  name: _nameController.text,
                                  description: _descriptionController.text,
                                  userId: 2, // Sabit kullanıcı ID'si
                                  categoryId:
                                      categories.indexOf(selectedCategory),
                                  star: int.tryParse(_starController.text),
                                  foodPhoto: _foodPhotoController.text,
                                  ownPhoto: _ownPhotoController.text,
                                  ownname: _ownNameController.text,
                                );

                                bool success =
                                    await FoodService().addFood(newRecipe);

                                if (success) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Tarif başarıyla eklendi')),
                                  );
                                  _formKey.currentState!.reset();
                                  setState(() {
                                    selectedCategory = categories.first;
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Tarif eklenirken bir hata oluştu')),
                                  );
                                }
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tarifi Ekle",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
