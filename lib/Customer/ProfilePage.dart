import 'package:flutter/material.dart';
import 'package:fyp/Customer/BottomNavBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Sample user data - in a real app, this would come from a user service or state management
  final Map<String, String> _userInfo = {
    'firstName': 'Lim',
    'lastName': 'Chin Yi',
    'email': 'limchinyi1@gmail.com',
    'phone': '0184717829',
    'address': 'Penang',
    'password': '********',
  };

  void _handleEditField(String field) {
    String fieldKey = '';
    switch (field) {
      case 'First Name':
        fieldKey = 'firstName';
        break;
      case 'Last Name':
        fieldKey = 'lastName';
        break;
      case 'Email':
        fieldKey = 'email';
        break;
      case 'Phone Number':
        fieldKey = 'phone';
        break;
      case 'Address':
        fieldKey = 'address';
        break;
      case 'Password':
        fieldKey = 'password';
        break;
    }

    Navigator.pushNamed(
      context,
      '/edit-information',
      arguments: {
        'fieldType': field,
        'currentValue': _userInfo[fieldKey] ?? '',
      },
    ).then((result) {
      if (result != null && result is String) {
        setState(() {
          _userInfo[fieldKey] = result;
        });
      }
    });
  }

  void _handleNavigation(String route) {
    if (route == '/profile') return; // Already on profile page

    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF141414),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User Avatar and Name
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Avatar
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(64),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=128&h=128&fit=crop&crop=face',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Name
                  Text(
                    'Lim Chin Yi',
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Color(0xFF141414),
                    ),
                  ),
                ],
              ),
            ),

            // User Information Section
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Information',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xFF141414),
                  ),
                ),
              ),
            ),

            // Information Fields
            _buildInfoField(
              'First Name',
              _userInfo['firstName']!,
              () => _handleEditField('First Name'),
            ),
            _buildInfoField(
              'Last Name',
              _userInfo['lastName']!,
              () => _handleEditField('Last Name'),
            ),
            _buildInfoField(
              'Email',
              _userInfo['email']!,
              () => _handleEditField('Email'),
            ),
            _buildInfoField(
              'Phone Number',
              _userInfo['phone']!,
              () => _handleEditField('Phone Number'),
            ),
            _buildInfoField(
              'Address',
              _userInfo['address']!,
              () => _handleEditField('Address'),
            ),
            _buildInfoField(
              'Password',
              _userInfo['password']!,
              () => _handleEditField('Password'),
            ),

            // Bottom spacing
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: '/profile'),
    );
  }

  Widget _buildInfoField(String label, String value, VoidCallback onEdit) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xFF141414),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF737373),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onEdit,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.edit, color: Color(0xFF141414), size: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    String route,
    bool isActive,
  ) {
    return GestureDetector(
      onTap: () => _handleNavigation(route),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: isActive
              ? const Color(0xFF141414).withOpacity(0.1)
              : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive
                  ? const Color(0xFF141414)
                  : const Color(0xFF737373),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: isActive
                    ? const Color(0xFF141414)
                    : const Color(0xFF737373),
              ),
            ),
          ],
        ),
      ),
    );
  }
}