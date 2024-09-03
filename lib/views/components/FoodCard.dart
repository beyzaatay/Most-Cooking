import 'package:flutter/material.dart';
import 'package:most_cooking/models/FoodList_model.dart';
import 'package:most_cooking/services/api/FoodService.dart';
import 'package:most_cooking/views/pages/recipesDetail.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  Future<List<FoodListModel>?>? _futureFoodList;

  @override
  void initState() {
    super.initState();
    _futureFoodList = FoodService().listFood(); // Başlatma işlemi
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<FoodListModel>?>(
        future: _futureFoodList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return RecipeCard(food: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final FoodListModel food;

  const RecipeCard({required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        FoodService foodService = FoodService();
        FoodListModel? foodDetail = await foodService.getFoodById(food.id!);
        if (foodDetail != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipesDetail(food: foodDetail),
            ),
          );
        } else {
          // Hata durumunu ele alabilirsiniz
          print('Failed to fetch food details.');
        }
      },
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color.fromARGB(255, 247, 235, 199),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    validateImageUrl("${food.foodPhoto}") ??
                        'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network(
                          'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg'); // Hata durumunda gösterilecek yedek resim
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name ?? 'No name', // Modelden gelen tarif adı
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      food.description ??
                          'No description', // Modelden gelen açıklama
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            SizedBox(width: 5),
                            Text(
                              food.star?.toString() ??
                                  '0', // Modelden gelen puan
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        Text(
                          'Kategori: ${food.categoryId.toString() ?? 'Unknown'}', // Modelden gelen kategori
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            validateImageUrl(
                                  validateImageUrl("${food.ownPhoto}") ??
                                      'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg',
                                ) ??
                                'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg',
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          food.ownName ?? 'Unknown', // Modelden gelen yazar adı
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateImageUrl(String? url) {
    if (url == null || url.isEmpty) {
      return null;
    }
    url = url.trim(); // Gereksiz boşlukları temizle
    if (Uri.tryParse(url)?.hasAbsolutePath == false) {
      return null;
    }
    return url;
  }
}
