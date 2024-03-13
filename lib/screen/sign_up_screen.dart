// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application/app_route.dart';
import 'package:flutter_application/service/api_service.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fristnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: fristnameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: lastnameController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final ApiService service = ApiService();
                final result = await service.signUpWithEmail(
                  emailController.text,
                  passwordController.text,
                );
                print("hello from $result");
                if (result == "ok") {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouter.login,
                    (route) => false, // ลบทุกหน้าออกจาก Stack
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
// suthicha