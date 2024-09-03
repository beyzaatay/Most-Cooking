import 'package:flutter/material.dart';
import 'package:most_cooking/models/FoodList_model.dart';
import 'package:most_cooking/views/components/Appbar.dart';
import 'package:most_cooking/views/components/comments.dart';

import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/components/recipesDetailSlider.dart';

class RecipesDetail extends StatefulWidget {
  final FoodListModel food;
  const RecipesDetail({required this.food});

  @override
  State<RecipesDetail> createState() => RrecipesDetailState();
}

class RrecipesDetailState extends State<RecipesDetail> {
  @override
  Widget build(BuildContext context) {
    var ScreenSize = MediaQuery.of(context);
    final double screenHeight = ScreenSize.size.height;
    final double screenWidth = ScreenSize.size.width;
    return Scaffold(
      appBar: Appbar(),
      backgroundColor: Arkaplan,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: screenWidth,
            child: Card(
                color: Color.fromARGB(255, 247, 235, 199),
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.food.name ?? 'Food Details',
                          style: TextStyle(
                              color: Turuncu,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          SizedBox(width: 5),
                          Text(
                            "${widget.food.star}" ?? 'star',
                            style: TextStyle(fontSize: 14),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text("kategori"),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Turuncu),
                                  onPressed: () {},
                                  child: Text(
                                    "${widget.food.categoryId}" ?? "Tatlı",
                                    style: TextStyle(color: Colors.black),
                                  ))
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            widget.food.description ?? "kısa tarif açıklaması"),
                      ),
                      RecipesDetailSlider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.food.description ??
                            "Öncelikle, fırını 200 dereceye (392 Fahrenheit) ısıtın. Küçük sufle kaplarını tereyağı ile yağlayın ve ardından şekerle kaplayın. Bu, suflenizin yapışmamasını ve güzelce kabarmasını sağlar.Bir kaba 100 gram bitter çikolata ve 2 yemek kaşığı tereyağı koyarak benmari usulü eritin. Benmari usulü için, çikolata ve tereyağı bulunan kabı, içinde kaynamakta olan su dolu bir tencerenin üzerine yerleştirin ve karışımın iyice erimesini sağlayın. Bu işlem sırasında çikolatanın yanmaması için dikkatli olun. Çikolata ve tereyağı eridikten sonra karışımı ocaktan alın ve biraz soğuması için kenara koyun."),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Malzemeler",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Turuncu),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.food.description ??
                            "İşte klasik çikolatalı sufle tarifi için gerekli malzemeler:### Malzemeler:- 100 gram bitter çikolata- 2 yemek kaşığı tereyağı- 2 adet yumurta (sarısı ve beyazı ayrılmış)- 1/4 su bardağı toz şeker- Bir tutam tuz- Sufle kaplarını yağlamak için ekstra tereyağı- Sufle kaplarını kaplamak için ekstra toz şeker- Üzerine serpmek için pudra şekeri (isteğe bağlı)Bu malzemeler ile lezzetli ve kabarık çikolatalı sufleler yapabilirsiniz. Afiyet olsun!"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Yorumlar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Turuncu),
                        ),
                      ),
                      Comments(),
                    ],
                  ),
                )),
          ),
        ]),
      ),
    );
  }
}
