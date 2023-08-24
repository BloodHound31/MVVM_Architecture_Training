import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {

  final List<dynamic> list;
  final dynamic dropDownValue;

  final void Function(dynamic) onChange;

  const CustomDropDown({super.key, required this.list, this.dropDownValue, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF8B9AD8),
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          hint: const Text('A-Z'),
          value: dropDownValue,
          icon: const Icon(Icons.arrow_drop_down_outlined, size: 18, color: Color(0xFF293771)),
          elevation: 14,
          style: const TextStyle(color: Color(0xFF293771), fontSize: 14, fontWeight: FontWeight.bold),
          dropdownColor: const Color(0xFF8B9AD8),
          onChanged: onChange,
          items: list.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(value.toString()),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
