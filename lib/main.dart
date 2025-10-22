import 'package:flutter/material.dart';
import 'package:tp1/Screens/HomeScreen/home_screen.dart';
import 'package:tp1/Screens/LibraryScreen/library_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}