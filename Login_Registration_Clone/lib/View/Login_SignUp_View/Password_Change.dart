import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Utils/utils.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/Login&Registration/login_view_model.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff293772), Color(0xFF354899), Color(0xFF415ABF)],
          ),
        ),
        child: Column(
          children: [
            const Row(
              children: [
                SizedBox(width: 30.0),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Text(
                    "Change\nPassword",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF1F2EB),
                    ),
                  ),
                ),
              ],//Row Children
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF8C9BDA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 70, right: 70),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomWidgets.inputText(textField: 'EmailId', controller: _emailController),
                          const SizedBox(height: 20),
                          CustomWidgets.inputText(textField: 'oldPassword', controller: _oldPasswordController, isObsurce: true),
                          const SizedBox(height: 20.0),
                          CustomWidgets.inputText(textField: 'newPassword', controller: _newPasswordController, isObsurce: true),
                          const SizedBox(height: 25),
                          CustomWidgets.customElevatedButton(
                              onPress: (){
                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, perform your action here
                                  String email = _emailController.text;
                                  String oldPassword = _oldPasswordController.text;
                                  String newPassword = _newPasswordController.text;
                                  Map data = <String, String>{
                                    'email': email,
                                    'old': oldPassword,
                                    'new': newPassword
                                  };

                                  loginViewModel.changePasswordApi(data, context);

                                } else {
                                  // Form is invalid
                                  Utils.toastMessage('Some thing went wrong');
                                }
                              },
                          ),
                        ],//ColumnChildren
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
