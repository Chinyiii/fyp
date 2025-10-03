import 'package:flutter/material.dart';
import 'package:fyp/Customer/BottomNavBar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  // Sample user data
  final Map<String, String> _userInfo = {
    'firstName': 'Lim',
    'lastName': 'Chin Yi',
    'email': 'limchinyi1@gmail.com',
    'phone': '0184717829',
    'address': 'Penang',
    'password': '********',
  };

  void _handleEditField(String field) {
    if (field == 'Address') {
      Navigator.pushNamed(context, '/address-book');
      return;
    }
    if (field == 'Password') {
      Navigator.pushNamed(context, '/change-password');
      return;
    }

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w800,
            fontSize: 22,
            color: Color(0xFF0A0A0A),
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        children: [
          // User Avatar and Name
          Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : const NetworkImage(
                            'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=128&h=128&fit=crop&crop=face',
                          ) as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.camera_alt, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '${_userInfo['firstName']} ${_userInfo['lastName']}',
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Color(0xFF141414),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // User Information Section
          const Text(
            'User Information',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xFF141414),
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoField('First Name', _userInfo['firstName']!, () => _handleEditField('First Name')),
          _buildInfoField('Last Name', _userInfo['lastName']!, () => _handleEditField('Last Name')),
          _buildInfoField('Email', _userInfo['email']!, () => _handleEditField('Email')),
          _buildInfoField('Phone Number', _userInfo['phone']!, () => _handleEditField('Phone Number')),
          _buildInfoField('Address', _userInfo['address']!, () => _handleEditField('Address')),
          _buildInfoField('Password', _userInfo['password']!, () => _handleEditField('Password')),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: '/profile'),
    );
  }

  Widget _buildInfoField(String label, String value, VoidCallback onEdit) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
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
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xFF0A0A0A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
            ),
            if (label != 'Email')
              GestureDetector(
                onTap: onEdit,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF0A0A0A),
                    size: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
