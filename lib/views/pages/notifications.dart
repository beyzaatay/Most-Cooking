import 'package:flutter/material.dart';
import 'package:most_cooking/utils/renkler.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<Map<String, String>> notifications = [
    {"text": "Yeni mesajınız var.", "date": "2024-07-15"},
    {"text": "Sistem güncellemesi mevcut.", "date": "2024-07-14"},
    {"text": "Bugün için hatırlatıcı.", "date": "2024-07-13"},
    {"text": "Yeni arkadaşlık isteği.", "date": "2024-07-12"},
    {"text": "Yeni arkadaşlık isteği.", "date": "2024-07-12"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Arkaplan,
      appBar: AppBar(
        backgroundColor: Turuncu,
        title: Text(
          "Bildirimler",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(
            notification: notifications[index]["text"]!,
            date: notifications[index]["date"]!,
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String notification;
  final String date;

  const NotificationCard(
      {super.key, required this.notification, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.notification_add,
              color: Turuncu,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification),
                  SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
