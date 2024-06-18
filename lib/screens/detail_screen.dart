// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import '../model/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  DetailScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(email.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(email.body),
      ),
    );
  }
}