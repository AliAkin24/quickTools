import 'package:flutter/material.dart';
import '../utils/timezone_utils.dart';

class TimeZoneScreen extends StatefulWidget {
  @override
  _TimeZoneScreenState createState() => _TimeZoneScreenState();
}

class _TimeZoneScreenState extends State<TimeZoneScreen> {
  String _selectedFromTimeZone = 'Lebanon';
  String _selectedToTimeZone = 'Lebanon';
  String _convertedTime = '';
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _convertTime() {
    final result = convertTime(
      _selectedTime,
      _selectedFromTimeZone,
      _selectedToTimeZone,
    );
    setState(() {
      _convertedTime = result;
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _convertTime();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Zone Converter'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Time:',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                onPressed: () => _selectTime(context),
                child: Text(
                  '${_selectedTime.format(context)}',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'From Time Zone:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButton<String>(
                value: _selectedFromTimeZone,
                items: timeZones.keys
                    .map((zone) => DropdownMenuItem(
                  value: zone,
                  child: Text(zone),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedFromTimeZone = value!;
                    _convertTime();
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'To Time Zone:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButton<String>(
                value: _selectedToTimeZone,
                items: timeZones.keys
                    .map((zone) => DropdownMenuItem(
                  value: zone,
                  child: Text(zone),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedToTimeZone = value!;
                    _convertTime();
                  });
                },
              ),
              SizedBox(height: 30),
              Text(
                'Converted Time:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                _convertedTime.isEmpty ? 'Select time and zones' : _convertedTime,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
