import 'package:flutter/material.dart';
import 'movie_list.dart';

const primaryColor = Color(0xFF151026);
const borderTopRight = const Radius.circular(10.0);
const borderBottomRight = const Radius.circular(40.0);

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MovieList(),
    );
  }
}
