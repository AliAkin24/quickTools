import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import to access Clipboard
import '../utils/password_utils.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  String _generatedPassword = '';

  void _generatePassword() {
    setState(() {
      _generatedPassword = generateRandomPassword();
    });
  }

  // Function to copy password to clipboard
  void _copyToClipboard() {
    if (_generatedPassword.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: _generatedPassword));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password copied to clipboard!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Generated Password:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _generatedPassword.isEmpty ? 'Press the button below' : _generatedPassword,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
                if (_generatedPassword.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: _copyToClipboard,
                  ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generatePassword,
              child: Text('Generate Password'),
            ),
          ],
        ),
      ),
    );
  }
}
