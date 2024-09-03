import 'package:flutter/material.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/pages/notifications.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Turuncu,
      automaticallyImplyLeading: false, // Geri butonunu kaldır
      title: Center(
          child: Row(children: [
        SizedBox(width: 120),
        Image.asset(
          "images/logo.png",
          height: 50,
        ),
      ])),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Notifications()));
          },
          icon: Icon(Icons.notifications),
          color: Colors.white,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
