import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm made by Chat-GPT',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
