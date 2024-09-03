import 'package:flutter/material.dart';
import 'package:most_cooking/services/api/FoodService.dart';
import 'package:most_cooking/views/pages/AddRecipes.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/components/RecipeCard.dart';
import 'package:most_cooking/views/pages/recipesDetail.dart';
import 'package:most_cooking/models/FoodList_model.dart'; // Import the model

class MyRecipes extends StatefulWidget {
  const MyRecipes({super.key});

  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {
  List<Map<String, dynamic>> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    final userFoodService = FoodService();
    try {
      final userId = 2; // Kullanıcı ID'si burada belirtiliyor
      final allRecipes =
          await userFoodService.getAllFoods(); // Tüm tarifleri al
      final userRecipes = allRecipes
          .where((recipe) => recipe['userId'] == userId)
          .toList(); // Kullanıcıya ait tarifleri filtrele
      setState(() {
        _recipes = userRecipes;
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Arkaplan,
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) //eğer yükleniyorsa
          : Column(
              //eğer yükleme tamamlandıysa
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tariflerim",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Turuncu),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        _recipes.length, //liste uzunluğu tariflerim kadar
                    itemBuilder: (context, index) {
                      final recipe = _recipes[index];
                      return GestureDetector(
                        //karta bastıgında detay sayfasına git
                        onTap: () async {
                          // Fetch the food details
                          FoodService foodService = FoodService();
                          FoodListModel? foodDetail =
                              await foodService.getFoodById(recipe['id']);
                          if (foodDetail != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipesDetail(food: foodDetail),
                              ),
                            );
                          } else {
                            // Handle the error case
                            print('Failed to fetch food details.');
                          }
                        },
                        child: RecipeCard(
                          name: recipe['name'] ?? 'Bilgi yok',
                          description: recipe['description'] ?? 'Açıklama Yok',
                          imageUrl: recipe['foodPhoto'] ??
                              'https://via.placeholder.com/150',
                          rating: recipe['star']?.toString() ?? '0',
                          category: recipe['categoryId']?.toString() ??
                              'Kategori Yok',
                          authorName: recipe['ownName'] ?? 'Yazar Bilgisi Yok',
                          authorImage: recipe['ownPhoto'] ??
                              'https://via.placeholder.com/150',
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddRecipes(),
                            ),
                          );
                        },
                        icon: Icon(Icons.add),
                        label: Text("Tarif ekle"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Turuncu),
                            iconColor: MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
