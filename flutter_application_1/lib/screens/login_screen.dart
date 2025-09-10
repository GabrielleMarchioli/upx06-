import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Importe a nova tela

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              // Ícone e título lado a lado
              Row(
                children: [
                  Icon(
                    Icons.cloud,
                    size: 36,
                    color: Colors.teal,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Label User
              const Text(
                'User',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // Campo User
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.teal[50],
                  contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              // Label Password
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // Campo Password + botão
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.teal[50],
                        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Botão circular
                  Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: () {
                        // Lógica de login comentada para backend
                        // TODO: Implementar validação de login pelo backend
                        // Exemplo de validação fictícia:
                        // if (userController.text == 'user' && passwordController.text == 'pass') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DashboardScreen()),
                        );
                        // }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Texto de ajuda
              const Text(
                'Esqueci minha senha\nou não tenho cadastro',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}