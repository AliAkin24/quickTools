import 'dart:math';

String generateRandomPassword() {
  const String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()';
  const int passwordLength = 12;

  Random random = Random();
  String password = List.generate(passwordLength, (index) => characters[random.nextInt(characters.length)]).join();

  return password;
}
