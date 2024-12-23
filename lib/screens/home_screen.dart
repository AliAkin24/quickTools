import 'package:flutter/material.dart';
import 'password_screen.dart';
import 'timezone_screen.dart';
import 'affirmation_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QuickTools')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => PasswordScreen()));
              },
              child: Text('Generate Password'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => TimeZoneScreen()));
              },
              child: Text('Convert Time'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AffirmationScreen()));
              },
              child: Text('Daily Affirmation'),
            ),
          ],
        ),
      ),
    );
  }
}
