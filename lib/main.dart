import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // Import HomePage
import 'pages/login_page.dart'; // Import LoginPage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[100],
      ),
      home: LoginPage(), // Start with the login page
    );
  }
}