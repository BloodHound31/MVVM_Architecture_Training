import 'package:flutter/material.dart';

class CustomWidgets{


  static Widget inputText({textField, controller, isObsurce = false}){
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFEFF0E9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(
            color: Color(0xFF2E3E80),
            blurRadius: 10.0,
            offset: Offset(0,10),
          )]
      ),
      child: TextFormField(
        controller: controller,
        validator: (value){
          String? text;
          if(value!.isEmpty){
            text = '$textField not filled';
          }
          return text;
        },
        style: const TextStyle(color: Colors.black),
        obscureText: isObsurce,
        decoration: InputDecoration(
            fillColor: Colors.transparent,
            filled: true,
            hintText: textField,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),

      ),
    );
  }


  static Widget customElevatedButton({required VoidCallback onPress, double borderRadius = 60}){
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 20.0, horizontal: 70)),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
        )),
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff293772)),
      ),
      onPressed: onPress,
      child:const Text('Submit', style: TextStyle(fontSize: 20.0, color: Color(0xFFF1F2EB)),),
    );
  }


  static Widget customHomePageButton({required VoidCallback onPress, required text}){
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        fixedSize: MaterialStateProperty.all<Size>(const Size(300.0, 150.0)),
      ),
      onPressed: onPress,
      child: Text(
        '$text',
        style: const TextStyle(
          fontSize: 50.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

}