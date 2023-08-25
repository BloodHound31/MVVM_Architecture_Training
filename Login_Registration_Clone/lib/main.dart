import 'package:flutter/material.dart';
import 'package:login_registration_clone/Utils/Routes/routes.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_view_model.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/CheckoutViewModel.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/Products_ViewModel.dart';
import 'package:provider/provider.dart';

import 'ViewModel/Login&Registration/login_view_model.dart';
import 'ViewModel/OrderViewModel/payment_summary_view_model.dart';
import 'ViewModel/ProductsViewModel/CartViewModel.dart';


void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => LoginViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => ProductViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => CartViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => CheckoutViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => OrderListViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => OrderSummaryViewModel()),
        ChangeNotifierProvider(create: (BuildContext context) => PaymentSummaryViewModel())
      ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.orderListRoute,
      onGenerateRoute: Routes.generateRoute,
    ),
  ));
}



