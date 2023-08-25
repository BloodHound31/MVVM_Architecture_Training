import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';


class CustomerDetails extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController addressController;
  const CustomerDetails({super.key, required this.nameController, required this.addressController});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF293771),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: const Text('Details', style: TextStyle(color: Colors.white),),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: CustomWidgets.inputText(textField: 'Name', controller: nameController),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: CustomWidgets.inputText(textField: 'Address', controller: addressController),
          ),
        ],
      ),
    );
  }
}
