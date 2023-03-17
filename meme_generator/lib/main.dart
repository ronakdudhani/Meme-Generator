import 'package:flutter/material.dart';
import 'package:meme_generator/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meme Generator',
      theme: ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}

