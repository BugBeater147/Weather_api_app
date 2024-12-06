import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsScreen extends StatelessWidget {
  final TextEditingController _themeController = TextEditingController();

  void savePreference(String theme) {
    FirebaseFirestore.instance
        .collection('user_preferences')
        .doc('theme')
        .set({'selected_theme': theme});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _themeController,
              decoration: InputDecoration(labelText: "Enter Theme"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                savePreference(_themeController.text);
              },
              child: Text("Save Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
