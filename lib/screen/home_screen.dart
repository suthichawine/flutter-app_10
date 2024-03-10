// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application/app_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yummy Milktea Shop'),
      ),
      body: Column(
        children: [
          Image.asset(
            'images/bt.jpg',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            child: SizedBox(
              child: Text(
                'Get the Best\nMilkTea In Town!',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 30),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.signup);
               // โค้ดที่ต้องการให้ทำงานเมื่อกดปุ่ม "Register"
                },
                child: Text('Sign up'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouter.login);

                  // โค้ดที่ต้องการให้ทำงานเมื่อกดปุ่ม "Login"
                },
                child: Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
