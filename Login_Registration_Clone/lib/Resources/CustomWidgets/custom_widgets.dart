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


  static Widget chequeNumberField({textField, Widget suffixIcon = const SizedBox.shrink()}){
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: AppColor.searchBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 14,color: AppColor.propsColor, fontFamily: 'JoannaSansNovaBook'),
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: textField,
            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            fillColor: Colors.transparent,
            filled: true,
            hintStyle: const TextStyle(fontSize: 14,color: AppColor.propsColor, fontFamily: 'JoannaSansNovaBook'),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
        ),
      ),
    );
  }

  static Widget dateBox({required String text, required VoidCallback onPress}){
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: AppColor.searchBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                style: const TextStyle(
                fontSize: 14,
                color: AppColor.propsColor,
                fontFamily: 'JoannaSansNovaBook',
                fontWeight: FontWeight.bold,
              ),
              ),
              InkWell(
                onTap: onPress,
                child: const Icon(
                  Icons.calendar_month,
                  color: AppColor.propsColor,
                  size: 18,
                ),
              )
            ]
          ),
        ),
      ),
    );
  }


  static Widget customElevatedButton({required VoidCallback onPress, double borderRadius = 60, color = AppColor.propsColor, text = 'Submit', bool loading = false, double height = 9.0}){
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: height, horizontal: 70)),
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


  static Widget customText({required String text, FontWeight fontWeight = FontWeight.normal, double? fontSize = 16.0}){
    return Text(text,
      style:TextStyle(
          fontSize: fontSize,
          color: AppColor.propsColor,
          fontFamily: 'JoannaSansNovaBook',
          fontWeight: fontWeight,
      ),);
  }

}