import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/colors.dart';

class CustomDropDown extends StatelessWidget {

  final List<dynamic> list;
  final dynamic dropDownValue;

  final void Function(dynamic) onChange;

  final double borderRadius;

  final double dropDownHeight;

  final Color bgColor;

  final Color textColor;

  final Widget? icon;

  const CustomDropDown({super.key, required this.list, required this.dropDownValue, required this.onChange, required this.borderRadius, required this.bgColor, required this.textColor, required this.dropDownHeight, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dropDownHeight,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          hint: const Text('Select Payment Method', style: TextStyle(color: AppColor.propsColor),),
          value: dropDownValue,
          icon: icon,
          isExpanded: true,
          style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.bold,),
          alignment: Alignment.center,
          dropdownColor: bgColor,
          onChanged: onChange,
          items: list.map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Center(child: Text(value.toString())),
            );
          }).toList(),
        ),
      ),
    );
  }
}
