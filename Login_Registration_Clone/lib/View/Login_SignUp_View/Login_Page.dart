import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';
import 'package:login_registration_clone/Utils/utils.dart';
import 'package:provider/provider.dart';

import '../../Resources/CustomWidgets/custom_widgets.dart';
import '../../ViewModel/Login&Registration/login_view_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColor.gradientIndigo,
          ),
        ),
        padding: const EdgeInsets.only( top: 100.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                      'Welcome\nBack',
                      style: TextStyle(
                        fontSize: 50,
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
                  color: Color(0xFF8C9BDA),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Column(
                        children: [
                          const SizedBox(height: 80),
                          CustomWidgets.inputText(textField: 'EmailId', controller: _emailController),
                          const SizedBox(height: 20),
                          CustomWidgets.inputText(textField: 'Password', controller: _passwordController, isObsurce: true),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, RouteNames.changePasswordRoute);
                            },
                            child:const Text('Forgot Password?', style: TextStyle(fontSize: 18.0, color: Color(0xFF354899)),),
                          ),
                          CustomWidgets.customElevatedButton(
                              onPress: (){
                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, perform your action here
                                  String email = _emailController.text;
                                  String password = _passwordController.text;
                                  Map data = {
                                    'emailId': email,
                                    'password': password
                                  };
                                  loginViewModel.loginApi(data, context);
                                  //Utils.toastMessage('Login Successful');
                                } else {
                                  // Form is invalid
                                  Utils.toastMessage('SomeThing is missing');
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
