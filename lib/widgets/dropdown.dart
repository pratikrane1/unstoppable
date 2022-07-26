import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  int? dropdownValue = 1;
  @override
  Widget build(BuildContext context) {
    return  DropdownButton<int>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
      elevation: 16,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold),
      // underline: Container(
      //   height: 2,
      //   color: Colors.deepPurpleAccent,
      // ),
      onChanged: (int? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <int>[1, 2, 3, 4]
          .map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(
            '$value',
          ),
        );
      }).toList(),
    );
  }
}