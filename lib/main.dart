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
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        textTheme: Typography.material2021().black,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        textTheme: Typography.material2021().white,
      ),
      home: const HomeScreen(),
    );
  }
}