class Email {
  final int id;
  final String subject;
  final String body;
  bool isRead;

  Email({
    required this.id,
    required this.subject,
    required this.body,
    this.isRead = false,
  });
}