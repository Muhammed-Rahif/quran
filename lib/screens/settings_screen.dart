import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, this.onBack});

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (notification) => true,
        title: const Text('Settings'),
        leading: IconButton.filled(
          isSelected: true,
          onPressed: () {
            onBack?.call();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: <Widget>[
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          const ListTile(
            title: Text('Font Size'),
            trailing: Text('16'),
          ),
          const ListTile(
            title: Text('Translations'),
            trailing: Text('English'),
          ),
        ],
      ),
    );
  }
}
