import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhSesliaPandiangan',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
