import 'package:login_registration_clone/Data/Network/base_api_service.dart';
import 'package:login_registration_clone/Data/Network/ResponseApiService.dart';
import 'package:login_registration_clone/Resources/application_urls.dart';

class AuthRepository{

  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async{

    try{
      dynamic response = await _apiService.getPostApiResponse(ApplicationUrls.loginEndPoint, data);
      return response;
    }
    catch(e)
    {
      throw e;
    }

  }

  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse(ApplicationUrls.registerEndPoint, data);
      return response;
    }
    catch(e)
    {
      throw e;
    }
  }

  Future<dynamic> changePasswordApi(dynamic data) async{
    try{
      dynamic response = await _apiService.getPostApiResponse(ApplicationUrls.changePasswordEndPoint, data, sendAsJson: false);
      return response;
    }
    catch(e)
    {
      throw e;
    }
  }
}