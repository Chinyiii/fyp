
import 'package:flutter/material.dart';
import 'package:fyp/Customer/BottomNavBar.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          _buildSectionHeader('Account'),
          _buildSettingsTile(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          _buildSectionHeader('General'),
          _buildSwitchTile(
            icon: Icons.notifications,
            title: 'Notifications',
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          _buildSwitchTile(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          _buildSectionHeader('Other'),
          _buildSettingsTile(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          _buildSettingsTile(
            icon: Icons.info,
            title: 'About',
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          _buildSettingsTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentRoute: '/settings'),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon),
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
