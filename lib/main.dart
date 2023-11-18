import './screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Contactos',
      home: MyHomePage("Mis Contactos"),
      theme: ThemeData(
        fontFamily: 'Montserrat', // Fuente principal
        textTheme: TextTheme(
          titleLarge: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
        ),
      ),
    );
  }
}
