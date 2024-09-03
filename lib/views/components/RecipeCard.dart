import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final String rating;
  final String category;
  final String authorName;
  final String authorImage;

  const RecipeCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.category,
    required this.authorName,
    required this.authorImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  validateImageUrl(
                        validateImageUrl("${imageUrl}") ??
                            'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg',
                      ) ??
                      'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg',
                  // Görsel URL'si buraya
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
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
                            rating,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        'Kategori: ${category.toString()}',
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
                                validateImageUrl("${authorImage}") ??
                                    'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg',
                              ) ??
                              'https://cdn.yemek.com/mnresize/1250/833/uploads/2018/04/manlama-yemekcom.jpg',
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        authorName,
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
