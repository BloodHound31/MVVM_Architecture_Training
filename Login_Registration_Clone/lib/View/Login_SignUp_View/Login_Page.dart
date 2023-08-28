import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/Utils/Paths/assets_path.dart';
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
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backGroundColor,
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetPath.backGroundPath),
            fit: BoxFit.cover
          )
        ),
        padding: const EdgeInsets.only( top: 200.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text(
                      'LOG-IN',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColor.whiteColor,
                      )
                  ),

                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        CustomWidgets.inputText(textField: 'USERNAME', controller: _emailController, icon: Icons.person, color: AppColor.propsColor),
                        const SizedBox(height: 20),
                        CustomWidgets.inputText(textField: 'PASSWORD', controller: _passwordController, isObsurce: true, icon: Icons.lock, color: AppColor.propsColor),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, RouteNames.changePasswordRoute);
                          },
                          child:const Text('Forgot Password?', style: TextStyle(fontSize: 16.0, color: AppColor.whiteColor, fontFamily: 'JoannaSansNovaBook'),),
                        ),
                        Selector<LoginViewModel, bool>(
                          selector: (_, loginViewModel) => loginViewModel.loading,
                          builder: (__, value, _) {
                            return CustomWidgets.customElevatedButton(
                                loading: value,
                                text: 'Login',
                                borderRadius: 10,
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
                            );
                          },
                        )
                      ],
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
