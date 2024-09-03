import 'package:flutter/material.dart';
import 'package:most_cooking/views/pages/ChangePassword.dart';
import 'package:most_cooking/views/pages/EditProfile.dart';
import 'package:most_cooking/utils/renkler.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(90.0),
          child: Expanded(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://cdn.armut.com/images/services/08187-asci.jpg'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Kullanıcı Adı',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ad Soyad',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                const Text(
                  'user@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  child: const Text('Profili Düzenle'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Turuncu, foregroundColor: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword()));
                  },
                  child: const Text('Şifre değiştir'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Turuncu, foregroundColor: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
