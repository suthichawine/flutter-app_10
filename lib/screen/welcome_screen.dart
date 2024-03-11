import 'package:flutter/material.dart';
import 'package:flutter_application/app_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add the image widget here
            Image.asset(
              'images/tea.jpg',
              width: 500,
              height: 300,
            ),
            const SizedBox(height: 25),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(height: 16),
            const Text(
              "Yummy Milktea Shop",
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 32),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่างปุ่ม
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,AppRouter.home); // นำทางไปยังหน้า Register
              },
              child: Text('Get started'), // ข้อความบนปุ่ม "Get started"
            ),
          ],
        ),
      ),
    );
  }
}
