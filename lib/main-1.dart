import 'package:flutter/material.dart';
import 'package:movielist/main_screen.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());
const primaryColor = Color(0xFF151026);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List',
      theme: ThemeData(primaryColor: primaryColor),
      home: const MainScreen(),
    );
  }
}
