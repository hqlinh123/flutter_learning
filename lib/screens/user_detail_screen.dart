import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;  // Receive the user data
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${user.id}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Name: ${user.name}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
