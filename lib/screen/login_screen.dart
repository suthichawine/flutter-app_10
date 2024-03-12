import 'package:flutter/material.dart';
import 'package:flutter_application/app_route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Background image
          Image.asset(
            'images/tea.jpg',
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87), // เปลี่ยนขนาดและสีข้อความ
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail ',
                      labelStyle: TextStyle(
                          color: Colors.black87), // เปลี่ยนสีข้อความ Label
                    ),
                    style: TextStyle(
                        color: Colors.black87), // เปลี่ยนสีข้อความใน TextField
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.black87), // เปลี่ยนสีข้อความ Label
                    ),
                    style: TextStyle(
                        color: Colors.black87), // เปลี่ยนสีข้อความใน TextField
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouter.product);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue, // สีพื้นหลังปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18.0), // รูปร่างของปุ่ม
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white, // สีข้อความ
                        fontWeight: FontWeight.bold, // ตั้งค่าตัวหนา
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'ลืมรหัสผ่าน?',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold, // ตั้งค่าตัวหนา)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
