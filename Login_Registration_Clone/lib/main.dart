import 'package:flutter/material.dart';
import 'package:login_registration_clone/Utils/Routes/routes.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/Products_ViewModel.dart';
import 'package:provider/provider.dart';

import 'ViewModel/Login&Registration/login_view_model.dart';
import 'ViewModel/ProductsViewModel/CartViewModel.dart';


void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => LoginViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => ProductViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => CartViewModel()),
      ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.productListRoute,
      onGenerateRoute: Routes.generateRoute,
    ),
  ));
}



