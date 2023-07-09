import 'package:flutter/material.dart';
import 'package:ui_teach_news/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TeachNews',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(54, 135, 255, 1.0),
        scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
      ),
      home: const Home(),
    );
  }
}
