
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:login_registration_clone/Repository/UserRepository/AuthRepository.dart';
import 'package:login_registration_clone/Utils/Routes/routes_name.dart';

import '../../Utils/utils.dart';


class LoginViewModel with ChangeNotifier{

  final _loginRepo = AuthRepository();
 // ApiResponse _loginResponse = ApiResponse.loading();
  bool _loading = false;

  bool get loading => _loading;


  // setLoginResponse(ApiResponse response){
  //   _loginResponse = response;
  //   notifyListeners();
  // }

  setLoading(bool value, BuildContext context){
    _loading = value;
    if(_loading){
      Navigator.pushNamed(context, RouteNames.loadingRoute);
    }else{
      Navigator.pop(context);
    }
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{

    //setLoginResponse(ApiResponse.loading());
    setLoading(true, context);
    _loginRepo.loginApi(data).then((value){
      setLoading(false, context);
      Utils.toastMessage(value.toString());
      Navigator.pushNamed(context, RouteNames.homeRoute);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      Utils.toastMessage(error.toString());
      setLoading(false, context);
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