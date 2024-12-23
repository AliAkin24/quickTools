import 'package:flutter/material.dart';
import '../utils/affirmation_utils.dart';

class AffirmationScreen extends StatefulWidget {
  @override
  _AffirmationScreenState createState() => _AffirmationScreenState();
}

class _AffirmationScreenState extends State<AffirmationScreen> {
  String _currentAffirmation = "Press the button to get your affirmation.";

  void _generateAffirmation() {
    setState(() {
      _currentAffirmation = getRandomAffirmation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Affirmations'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentAffirmation,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _generateAffirmation,
                child: Text(
                  'Get Affirmation',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
