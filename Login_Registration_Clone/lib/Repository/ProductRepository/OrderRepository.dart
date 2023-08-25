import 'package:login_registration_clone/Data/Network/base_api_service.dart';
import 'package:login_registration_clone/Resources/application_urls.dart';

import '../../Data/Network/ResponseApiService.dart';

class OrderRepository{

  final BaseApiService _apiService = NetworkApiService();


  Future<dynamic> changeAvailableStockApi (dynamic data) async{

    try{
      dynamic response = await _apiService.getPatchApiResponse(ApplicationUrls.productListEndPoint, data);
      return response;
    }
    catch(e)
    {
      throw e;
    }

  }

  Future<dynamic> userDetailsPostApi(dynamic data) async{

    try{
      dynamic response = await _apiService.getPostApiResponse(ApplicationUrls.userCreateEndPoint, data);
      return response;
    }
    catch(e)
    {
      throw e;
    }

  }

  Future<dynamic> createBillPostApi(dynamic data, dynamic userName) async{

    try{
      ApplicationUrls.setUsername(userName);
      dynamic response = await _apiService.getPostApiResponse(ApplicationUrls.createBillEndPoint, data);
      return response;
    }
    catch(e)
    {
      throw e;
    }

  }

}