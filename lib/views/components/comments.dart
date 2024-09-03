import 'package:flutter/material.dart';
import 'package:most_cooking/views/pages/AddComment.dart';
import 'package:most_cooking/utils/renkler.dart';

class Comments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true, // İç içe scroll için kullanılır
          physics:
              NeverScrollableScrollPhysics(), // İçteki ListView'in kaydırmasını engeller
          padding: const EdgeInsets.all(10),
          itemCount: 3, // Yorum sayısı
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Emel Özay",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            const Text(
                              "Takipçi",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Çikolatalı Sufle Tarifi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Tarifi denedim ve çok beğendim. Teşekkürler!",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_fm06SRIpBD0-ih81s3XCDVLB-KhVBIlDqg&s',
                          height: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("12.07.2021"),
                            Row(
                              children: const [
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddComment()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Turuncu, foregroundColor: Colors.white),
          child: const Text('Yeni Yorum Ekle'),
        ),
      ],
    );
  }
}
