import 'package:flutter/material.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';
import 'package:login_registration_clone/View/Login_SignUp_View/Home_Page.dart';
import 'package:login_registration_clone/View/Login_SignUp_View/Login_Page.dart';
import 'package:login_registration_clone/View/Login_SignUp_View/Registration_Page.dart';

import '../../View/Login_SignUp_View/Password_Change.dart';

class Routes{

  static Route<dynamic> generateRoute(RouteSettings setting){

    switch(setting.name){

      case RouteNames.homeRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const Home());
      case RouteNames.loginRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const Login());
      case RouteNames.registerRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const Registration());
      case RouteNames.changePasswordRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const ChangePassword());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Text('No route set', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
            ),
          );
        });
        
        
    }
  }

}