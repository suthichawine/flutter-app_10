import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/me.jpg'), // เปลี่ยนเป็น path รูปภาพของคุณ
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              'Suthicha Napputtachat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Computer Engineer',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: suthicha.na@ksu.ac.th',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: 0932438564',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
