class ChatMessage {
  final String from; // 'user' or 'agent'
  final String text;
  final DateTime timestamp;

  ChatMessage({
    required this.from,
    required this.text,
    required this.timestamp,
  });
}
