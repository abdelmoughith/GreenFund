import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../theme/colors.dart';
import '../theme/styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: AppStyles.inputDecoration('Nom complet'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: AppStyles.inputDecoration('Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: AppStyles.inputDecoration('Mot de passe'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: AppStyles.greenButton,
                child: const Text('Créer un compte'),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                'Déjà un compte ? Se connecter',
                style: TextStyle(color: AppColors.primaryGreen),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
