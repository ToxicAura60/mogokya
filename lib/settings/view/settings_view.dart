import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF1FA),
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFE4E4E4),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          settingsItem(
              title: "Pengaturan Umum",
              subtitle: "Notifikasi",
              icon: Icons.notifications,
              showSubtitle: true),
          SizedBox(
            height: 4,
          ),
          settingsItem(
            title: "Keamanan",
            subtitle: "Keamanan Akun",
            showSubtitle: true,
          ),
          SizedBox(
            height: 4,
          ),
          settingsItem(
            title: "Keluar",
            titleColor: Colors.red,
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}

class settingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;
  final bool showSubtitle;
  final Color titleColor;

  settingsItem({
    this.subtitle = '',
    required this.title,
    this.icon = Icons.settings,
    this.showSubtitle = false,
    this.titleColor = const Color(0xFF737373),
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Color(0xFFFFFFFF),
      trailing: Icon(Icons.chevron_right),
      title: Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      subtitle: showSubtitle
          ? Row(
              children: [
                Icon(
                  icon,
                  size: 32,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
