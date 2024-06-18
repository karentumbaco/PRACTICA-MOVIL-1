// lib/model/backend.dart
import 'email.dart';

class Backend {
  List<Email> _emails = [
    Email(id: 1, subject: 'Hello', body: 'How are you?', isRead: false),
    Email(id: 2, subject: 'Meeting', body: 'Let\'s have a meeting tomorrow.', isRead: false),
    Email(id: 3, subject: 'Greetings', body: 'Greetings from far away!', isRead: false),
  ];

  Future<List<Email>> getEmails() async {
    await Future.delayed(Duration(seconds: 1));
    return _emails;
  }

  Future<void> markEmailAsRead(int id) async {
    await Future.delayed(Duration(milliseconds: 500));
    _emails.firstWhere((email) => email.id == id).isRead = true;
  }

  Future<void> deleteEmail(int id) async {
    await Future.delayed(Duration(milliseconds: 500));
    _emails.removeWhere((email) => email.id == id);
  }
}