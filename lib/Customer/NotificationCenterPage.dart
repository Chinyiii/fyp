import 'package:flutter/material.dart';

class NotificationCenterPage extends StatelessWidget {
  final List<Map<String, String>> _notifications = [
    {
      'title': 'Order Shipped',
      'subtitle': 'Your order #123456 has been shipped.',
      'time': '2 hours ago',
    },
    {
      'title': 'New Arrival',
      'subtitle': 'Check out the new Air Jordan 1 Mid.',
      'time': '1 day ago',
    },
    {
      'title': 'Promotion',
      'subtitle': 'Get 20% off on all Nike products.',
      'time': '3 days ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text(notification['title']!),
            subtitle: Text(notification['subtitle']!),
            trailing: Text(notification['time']!),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}
