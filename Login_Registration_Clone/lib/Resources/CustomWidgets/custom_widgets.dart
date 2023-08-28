import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/colors.dart';

class CustomWidgets{


  static Widget inputText({textField, controller, isObsurce = false, icon, color}){
    return Container(
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(15),
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
        style: const TextStyle(color: AppColor.blackColor),
        obscureText: isObsurce,
        decoration: InputDecoration(

            contentPadding:  const EdgeInsets.symmetric(vertical: 10.0),
            prefixIconColor: color,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 40, right: 10),
              child: Icon(icon),
            ),
            fillColor: Colors.transparent,
            filled: true,
            hintStyle: TextStyle(color: color, fontFamily: 'JoannaSansNovaBook'),
            hintText: textField,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),

      ),
    );
  }


  static Widget customElevatedButton({required VoidCallback onPress, double borderRadius = 60, color = AppColor.propsColor, text = 'Submit', bool loading = false}){
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 9.0, horizontal: 70)),
        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
        )),
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      onPressed: onPress,
      child:loading ? const CircularProgressIndicator(color: AppColor.whiteColor,):Text(text, style: const TextStyle(fontSize: 20.0, color: AppColor.whiteColor, fontFamily: 'JoannaSansNovaBook'),),
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
          color: AppColor.blackColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


  static Widget customText({required String text}){
    return Text(text,
      style:const TextStyle(
          fontSize: 16,
          color: AppColor.propsColor,
          fontFamily: 'JoannaSansNovaBook'
      ),);
  }

}