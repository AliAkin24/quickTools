import 'package:flutter/material.dart';

const Map<String, int> timeZones = {
  'Lebanon': 2,
  'Palestine': 2,
  'Syria': 2,
  'Egypt': 2,
  'USA (Eastern Time)': -5,
  'USA (Central Time)': -6,
  'USA (Mountain Time)': -7,
  'USA (Pacific Time)': -8,
  'Germany': 1,
  'France': 1,
};

String convertTime(TimeOfDay time, String fromZone, String toZone) {
  int fromOffset = timeZones[fromZone] ?? 0;
  int toOffset = timeZones[toZone] ?? 0;
  int hourDiff = toOffset - fromOffset;

  int convertedHour = (time.hour + hourDiff) % 24;
  if (convertedHour < 0) {
    convertedHour += 24;
  }

  String formattedTime = '${convertedHour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  return formattedTime;
}
