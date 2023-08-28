import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/Utils/utils.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/Login&Registration/login_view_model.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

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
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: AppColor.whiteColor,
                      )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(

                decoration: const BoxDecoration(
                  color: AppColor.lightIndigo,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)),
                ),
                //margin: EdgeInsets.symmetric(horizontal: 40),
                child: Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 70),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomWidgets.inputText(textField: 'USERNAME', controller: _userNameController, icon: Icons.person, color: AppColor.darkIndigo),
                          const SizedBox(height: 20),
                          CustomWidgets.inputText(textField: 'EmailId', controller: _emailController, icon: Icons.alternate_email, color: AppColor.darkIndigo),
                          const SizedBox(height: 20),
                          CustomWidgets.inputText(textField: 'Password', controller: _passwordController, isObsurce: true, icon: Icons.lock, color: AppColor.darkIndigo),
                          const SizedBox(height: 20),
                          CustomWidgets.inputText(textField: 'details', controller: _detailsController, icon: Icons.edit, color: AppColor.darkIndigo),
                          const SizedBox(height: 20),
                          CustomWidgets.customElevatedButton(
                             borderRadius: 10,
                              text: 'Register',
                              onPress: (){
                                if (_formKey.currentState!.validate()){
                                  //Form is Valid
                                  String userName = _userNameController.text;
                                  String email = _emailController.text;
                                  String password = _passwordController.text;
                                  String details = _detailsController.text;
                                  Map data = {
                                    'userName': userName,
                                    'emailId': email,
                                    'password': password,
                                    'details': details
                                  };
                                  loginViewModel.registerApi(data, context);
                                }else{
                                  // Form is invalid
                                  Utils.toastMessage("SomeThing is missing");
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],//Children
        ),
      ),
    );
  }
}
