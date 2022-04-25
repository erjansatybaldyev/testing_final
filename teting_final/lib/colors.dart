import 'package:flutter/material.dart';

class LDropDownButton extends StatefulWidget {
  LDropDownButton({Key key}) : super(key: key);

  @override
  State<LDropDownButton> createState() => _LDropDownButtonState();
}

class _LDropDownButtonState extends State<LDropDownButton> {
  String dropdownValue = 'Green';
  List<String> dropdownitems = <String>[
    'green',
    'red',
    'Yellow',
    'Blue',
    'Pink',
    'Orange'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _getColor(dropdownValue),
      child: Center(
          child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 100,
        elevation: 6,
        style: TextStyle(color: Color.fromARGB(255, 243, 6, 6), fontSize: 36),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: dropdownitems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )),
    );
  }

  Color _getColor(String _color) {
    if (_color.compareTo('Green') == 0) {
      return Colors.green;
    } else if (_color.compareTo('red') == 0) {
      return Colors.red;
    } else if (_color.compareTo('Yeloow') == 0) {
      return Colors.yellow;
    } else if (_color.compareTo('Pink') == 0) {
      return Colors.pink;
    } else if (_color.compareTo('Orange') == 0) {
      return Colors.orange;
    } else if (_color.compareTo('blue') == 0) {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }
}
