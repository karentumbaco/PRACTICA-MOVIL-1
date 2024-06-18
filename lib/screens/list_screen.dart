// lib/screens/list_screen.dart
import 'package:flutter/material.dart';
import '../model/backend.dart';
import '../widgets/email_widget.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Email> _emails = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEmails();
  }

  Future<void> _loadEmails() async {
    final emails = await Backend().getEmails();
    setState(() {
      _emails = emails;
      _isLoading = false;
    });
  }

  void _markAsRead(int id) async {
    await Backend().markEmailAsRead(id);
    _loadEmails();
  }

  void _deleteEmail(int id) async {
    await Backend().deleteEmail(id);
    _loadEmails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emails')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _emails.length,
              itemBuilder: (context, index) {
                final email = _emails[index];
                return Dismissible(
                  key: Key(email.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteEmail(email.id);
                  },
                  background: Container(color: Colors.red),
                  child: EmailWidget(
                    email: email,
                    onLongPress: () => _markAsRead(email.id),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(email: email),
                        ),
                      ).then((_) => _markAsRead(email.id));
                    },
                  ),
                );
              },
            ),
    );
  }
}