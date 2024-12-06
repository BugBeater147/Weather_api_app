import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Updates'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('community_updates').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final updates = snapshot.data!.docs;
          return ListView.builder(
            itemCount: updates.length,
            itemBuilder: (context, index) {
              final data = updates[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  leading: data['photo_url'] != null
                      ? Image.network(data['photo_url'], width: 50, height: 50)
                      : Icon(Icons.cloud),
                  title: Text(data['location']),
                  subtitle: Text(data['weather_report']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
