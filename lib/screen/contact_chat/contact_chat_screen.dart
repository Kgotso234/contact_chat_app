import 'package:flutter/material.dart';
import '../../models/chat_message.dart';
import '../../widgets/chat_bubble.dart';

class ContactChatScreen extends StatefulWidget {
  const ContactChatScreen({super.key});

  @override
  State<ContactChatScreen> createState() => _ContactChatScreenState();
}

class _ContactChatScreenState extends State<ContactChatScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _chatInputController = TextEditingController();

  List<ChatMessage> messages = [];

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add(
        ChatMessage(from: 'user', text: text, timestamp: DateTime.now()),
      );
      messages.add(
        ChatMessage(
          from: 'agent',
          text: 'Thanks for reaching out!',
          timestamp: DateTime.now(),
        ),
      );
    });

    _chatInputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Support')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Contact Form
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Message'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Optionally process form input here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Form submitted (not connected to backend)"),
                  ),
                );
              },
              child: const Text('Send'),
            ),
            const Divider(height: 30),

            // Chat Interface
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return ChatBubble(text: msg.text, isUser: msg.from == 'user');
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _chatInputController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => sendMessage(_chatInputController.text),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
