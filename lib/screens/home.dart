import 'package:flutter/material.dart';

import './settings.dart';
import './products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ATeam Machine Test'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Card(
            child: ListTile(
              title: const Text('API & State Management'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ProductsScreen()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Settings Page (UI Section)'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => SettingsScreen()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
