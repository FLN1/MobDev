import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/homePage.dart';
import 'pages/settingsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (context) => Login(),
          '/home': (context) => homePage(),
          '/settings': (context) => settingsPage(),
        });
  }
}
