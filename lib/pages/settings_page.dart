import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 2, 0, 94)!, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              _buildSettingsCard(Icons.help_outline, 'Help & Support'),
              _buildSettingsCard(Icons.app_settings_alt, 'App Settings'),
              _buildSettingsCard(Icons.info_outline, 'About'),
              _buildSettingsCard(Icons.map_outlined, 'Map display'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 128, 128, 128),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(icon, color: const Color.fromARGB(255, 2, 0, 94)),
          trailing: Icon(Icons.arrow_forward_ios, color: const Color.fromARGB(255, 2, 0, 94)),
          onTap: () {
            // Handle navigation or other actions here
          },
        ),
      ),
    );
  }
}
