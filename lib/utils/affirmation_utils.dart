import 'dart:math';

const List<String> affirmations = [
  "You are capable of amazing things.",
  "Believe in yourself and all that you are.",
  "Every day is a new beginning.",
  "You are strong and resilient.",
  "You can achieve anything you set your mind to.",
  "Be kind to yourself and others.",
  "Your potential is limitless.",
  "You deserve happiness and success.",
  "Embrace challenges; they help you grow.",
  "Trust the journey, even when you don’t understand it.",
];

String getRandomAffirmation() {
  final random = Random();
  return affirmations[random.nextInt(affirmations.length)];
}
