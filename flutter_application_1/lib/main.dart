import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importe a tela inicial

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima App', // Título do app
      theme: ThemeData(
        primarySwatch: Colors.teal, // Tema consistente
      ),
      home: const HomeScreen(), // Tela inicial
      debugShowCheckedModeBanner: false, // Remove o banner de debug
    );
  }
}