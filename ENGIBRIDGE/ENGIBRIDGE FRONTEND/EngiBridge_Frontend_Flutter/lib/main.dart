import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() => runApp(const EngiBridgeApp());

class EngiBridgeApp extends StatelessWidget {
  const EngiBridgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EngiBridge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
