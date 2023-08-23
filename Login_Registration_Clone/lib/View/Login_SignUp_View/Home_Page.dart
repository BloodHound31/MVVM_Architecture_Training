import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          margin: const EdgeInsets.fromLTRB(0,240.0,0,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomWidgets.customHomePageButton(
                  onPress: (){Navigator.pushNamed(context, RouteNames.loginRoute);},
                  text: 'login',
              ),
              const SizedBox(height: 10),
              CustomWidgets.customHomePageButton(
                onPress: (){Navigator.pushNamed(context, RouteNames.registerRoute);},
                text: 'Register',
              ),
            ],
          ),
        )
    );
  }
}
