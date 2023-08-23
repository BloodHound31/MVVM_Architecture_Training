import 'package:flutter/material.dart';
import 'package:login_registration_clone/Utils/Routes/routes.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';
import 'package:provider/provider.dart';

import 'ViewModel/Login&Registration/login_view_model.dart';


void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => LoginViewModel()),
      ],
    child: const MaterialApp(
      initialRoute: RouteNames.homeRoute,
      onGenerateRoute: Routes.generateRoute,
    ),
  ));
}



