import 'package:eventix/src/features/login/presentation/views/login.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EventixApp());
}

class EventixApp extends StatelessWidget {
  const EventixApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}
