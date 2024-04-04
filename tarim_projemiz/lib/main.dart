import 'package:flutter/material.dart';

import 'myHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Audio Reading',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

