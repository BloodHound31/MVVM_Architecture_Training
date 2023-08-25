import 'package:flutter/material.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';
import 'package:login_registration_clone/View/Login_SignUp_View/Home_Page.dart';
import 'package:login_registration_clone/View/Login_SignUp_View/Login_Page.dart';
import 'package:login_registration_clone/View/Login_SignUp_View/Registration_Page.dart';
import 'package:login_registration_clone/View/OrderView/order_summary_view.dart';
import 'package:login_registration_clone/View/ProductsView/CheckOutPageView.dart';
import 'package:login_registration_clone/View/ProductsView/ProductsListPage.dart';

import '../../View/Login_SignUp_View/Password_Change.dart';
import '../../View/OrderView/order_list_view.dart';
import '../../View/ProductsView/CartPageView.dart';

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
      case RouteNames.productListRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const ProductList());
      case RouteNames.cartPageRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const CartPage());
      case RouteNames.checkoutPageRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const CheckoutPage());
      case RouteNames.orderListRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const OrderList());
      case RouteNames.orderSummaryRoute:
        return MaterialPageRoute(builder: (BuildContext context) => const OrderSummaryView());
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