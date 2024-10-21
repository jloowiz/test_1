import 'package:flutter/material.dart';
import 'package:test_1/models/Jeepney.dart';

class JeepneyDropdown extends StatefulWidget {
  final List<Jeepney> jeepneys;
  final Function(Jeepney?) onSelected;  // Add the onSelected callback

  const JeepneyDropdown({required this.jeepneys, required this.onSelected, super.key});

  @override
  _JeepneyDropdownState createState() => _JeepneyDropdownState();
}

class _JeepneyDropdownState extends State<JeepneyDropdown> {
  String? _selectedJeepneyName;
  Jeepney? _selectedJeepney;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: const Color.fromARGB(255, 0, 1, 85),  // Background color of the dropdown
        value: _selectedJeepneyName,
        onChanged: (value) {
          setState(() {
            _selectedJeepneyName = value;
            _selectedJeepney = widget.jeepneys.firstWhere(
                  (jeepney) => jeepney.jeepneyName == value,
            );
          });
          widget.onSelected(_selectedJeepney);  // Call onSelected when a jeepney is selected
        },
        items: widget.jeepneys.map((jeepney) {
          return DropdownMenuItem<String>(
            value: jeepney.jeepneyName,
            child: Text(
              jeepney.jeepneyName,
              style: const TextStyle(color: Colors.white),  // Text color
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: 'Select Jeepney',
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
