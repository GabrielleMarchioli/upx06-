import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importe a tela inicial
import 'screens/login_screen.dart'; // Importe a tela de login
import 'screens/dashboard_screen.dart'; // Importe a tela de dashboard
import 'screens/email_request_screen.dart'; // Importe a nova tela
import 'screens/code_verification_screen.dart'; // Importe a tela de verificação
import 'screens/register_screen.dart'; // Importe a tela de registro

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
      // Rotas para todas as telas
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/email_request': (context) => const EmailRequestScreen(),
        '/verification': (context) => const CodeVerificationScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}