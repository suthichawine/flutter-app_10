import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application/app_route.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key})
      : super(key: key); // เพิ่ม super(key: key) ที่นี่

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/milk.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation:
                    0, // ตั้งค่า elevation เป็น 0 เพื่อลบ shadow ที่มากับ Card เอง
                color: Colors.transparent, // ตั้งค่าสีของ Card เป็นโปร่งใส
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15), // ตั้งค่าการมีมุมของ Card
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white.withOpacity(
                          0.1), // ตั้งค่าสีพื้นหลังของ BackdropFilter
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.pink,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Yummy Milktea Shop",
                            style: TextStyle(
                                fontSize: 30, color: Colors.lightBlue),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRouter.home);
                            },
                            child: const Text(
                              'Get started',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
