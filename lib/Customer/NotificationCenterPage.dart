import 'package:flutter/material.dart';

class NotificationCenterPage extends StatefulWidget {
  const NotificationCenterPage({super.key});

  @override
  State<NotificationCenterPage> createState() => _NotificationCenterPageState();
}

class _NotificationCenterPageState extends State<NotificationCenterPage> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Order Shipped',
      'subtitle': 'Your order #123456 has been shipped.',
      'time': '2 hours ago',
      'icon': Icons.local_shipping_outlined,
      'isRead': false,
    },
    {
      'title': 'New Arrival',
      'subtitle': 'Check out the new Air Jordan 1 Mid.',
      'time': '1 day ago',
      'icon': Icons.new_releases_outlined,
      'isRead': false,
    },
    {
      'title': 'Promotion',
      'subtitle': 'Get 20% off on all Nike products.',
      'time': '3 days ago',
      'icon': Icons.local_offer_outlined,
      'isRead': true,
    },
    {
      'title': 'Order Delivered',
      'subtitle': 'Your order #123455 has been delivered successfully.',
      'time': '5 days ago',
      'icon': Icons.check_circle_outline,
      'isRead': true,
    },
  ];

  void _markAsRead(int index) {
    setState(() {
      _notifications[index]['isRead'] = true;
    });
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification['isRead'] = true;
      }
    });
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Notification deleted'),
        backgroundColor: const Color(0xFF0A0A0A),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = _notifications.where((n) => !n['isRead']).length;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Color(0xFF0A0A0A),
            letterSpacing: -0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF0A0A0A),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed: _markAllAsRead,
              child: const Text(
                'Mark All Read',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF757575),
                ),
              ),
            ),
        ],
      ),
      body: _notifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
        padding: const EdgeInsets.only(bottom: 24),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return _buildNotificationCard(
            context,
            notification,
            index,
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.notifications_outlined,
        size: 64,
        color: Color(0xFF9E9E9E),
      ),
    ),
    const SizedBox(height: 24),
    const Text(
    'No notifications',
    style: TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Color(0xFF0A0A0A),
    ),
    ),
    const SizedBox(height: 8),
    const Text(
    "You're all caught up!",
    style: TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color(0xFF9E9E9E),
    ),
    ),
    ],
    ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context,
      Map<String, dynamic> notification,
      int index,
      ) {
    final isRead = notification['isRead'] as bool;

    return Dismissible(
      key: Key(notification['title'] + index.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 24,
        ),
      ),
      onDismissed: (direction) {
        _deleteNotification(index);
      },
      child: GestureDetector(
        onTap: () {
          _markAsRead(index);
          // Handle notification tap navigation
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          decoration: BoxDecoration(
            color: isRead ? Colors.white : const Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isRead ? const Color(0xFFE0E0E0) : const Color(0xFF0A0A0A),
              width: isRead ? 1 : 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isRead ? const Color(0xFFF5F5F5) : const Color(0xFF0A0A0A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    notification['icon'] as IconData,
                    color: isRead ? const Color(0xFF757575) : Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification['title'],
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color(0xFF0A0A0A),
                              ),
                            ),
                          ),
                          if (!isRead)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0A0A0A),
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        notification['subtitle'],
                        style: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF757575),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notification['time'],
                        style: const TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}