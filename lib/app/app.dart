import 'package:flutter/material.dart';
import 'route.dart';

class ContactChatApp extends StatelessWidget {
  const ContactChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
