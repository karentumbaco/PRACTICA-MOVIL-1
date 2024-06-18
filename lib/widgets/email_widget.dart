// lib/widgets/email_widget.dart
import 'package:flutter/material.dart';
import '../model/email.dart';

class EmailWidget extends StatelessWidget {
  final Email email;
  final VoidCallback onLongPress;
  final VoidCallback onTap;

  EmailWidget({
    required this.email,
    required this.onLongPress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(email.subject, style: TextStyle(fontWeight: email.isRead ? FontWeight.normal : FontWeight.bold)),
      subtitle: Text(email.body, maxLines: 1, overflow: TextOverflow.ellipsis),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}