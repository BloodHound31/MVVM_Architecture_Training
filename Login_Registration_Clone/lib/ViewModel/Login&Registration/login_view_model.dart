
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:login_registration_clone/Repository/UserRepository/AuthRepository.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';

import '../../Utils/utils.dart';


class LoginViewModel with ChangeNotifier{

  final _loginRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async{

    _loginRepo.loginApi(data).then((value){
      Utils.toastMessage(value.toString());
      Navigator.pushNamed(context, RouteNames.registerRoute);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }

  Future<void> registerApi(dynamic data, BuildContext context) async{

    _loginRepo.registerApi(data).then((value){
      Utils.toastMessage('Your user is created');
      Navigator.pushNamed(context, RouteNames.loginRoute);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }

  Future<void> changePasswordApi(dynamic data, BuildContext context) async{

    _loginRepo.changePasswordApi(data).then((value){
      Utils.toastMessage(value.toString());
      Navigator.pushNamed(context, RouteNames.loginRoute);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }

}