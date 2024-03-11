import 'package:flutter/material.dart';
import 'package:flutter_application/app_route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'images/blue.jpg',

            width: MediaQuery.of(context)
                .size
                .width, // ขนาดเท่ากับความกว้างของหน้าจอ
            height: MediaQuery.of(context)
                .size
                .height, // ขนาดเท่ากับความสูงของหน้าจอ
            fit: BoxFit.cover, // ให้ภาพขยายเต็มพื้นที่ของหน้าจอ
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87), // เปลี่ยนขนาดและสีข้อความ
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail ',
                      labelStyle: TextStyle(
                          color: Colors.black87), // เปลี่ยนสีข้อความ Label
                    ),
                    style: TextStyle(
                        color: Colors.black87), // เปลี่ยนสีข้อความใน TextField
                  ),
                  const SizedBox(height: 16),
                  TextField(
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
                    child: const Text('ลืมรหัสผ่าน?',style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold, // ตั้งค่าตัวหนา)
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
