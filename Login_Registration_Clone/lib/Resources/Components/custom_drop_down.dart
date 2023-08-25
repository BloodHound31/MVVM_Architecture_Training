import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {

  final List<dynamic> list;
  final dynamic dropDownValue;

  final void Function(dynamic) onChange;

  final double borderRadius;

  final Color bgColor;

  final Color textColor;

  const CustomDropDown({super.key, required this.list, required this.dropDownValue, required this.onChange, required this.borderRadius, required this.bgColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          hint: const Text('A-Z'),
          value: dropDownValue,
          icon: Icon(Icons.arrow_drop_down_outlined, size: 18, color: textColor),
          elevation: 14,
          style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
          dropdownColor: bgColor,
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
