import 'package:flutter/material.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/components/Appbar.dart';
import 'package:most_cooking/views/pages/recipesDetail.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Arkaplan,
      appBar: Appbar(),
      body: Card(
        color: Arkaplan,
        margin: const EdgeInsets.all(16.0), // Card dış kenar boşluğu
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Kenar yuvarlama
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Card iç boşluk
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Yorumunuzu Yazın:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Turuncu),
                    ),
                    fillColor: const Color.fromARGB(255, 238, 232, 232),
                    filled: true,
                    hintText: 'Yorumunuzu buraya yazın...',
                    hintStyle: TextStyle(color: Colors.orange)),
              ),
              const SizedBox(height: 20),
              const Text(
                'Fotoğraf Yükleyin:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Turuncu, foregroundColor: Colors.white),
                child: const Text('Fotoğraf Seç'),
              ),
              const SizedBox(height: 10),
              Expanded(child: Container()), // Butonlar arasında boşluk
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //  context,
                    //  MaterialPageRoute(builder: (context) => RecipesDetail()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Turuncu, foregroundColor: Colors.white),
                  child: const Text('Yorumu Gönder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
