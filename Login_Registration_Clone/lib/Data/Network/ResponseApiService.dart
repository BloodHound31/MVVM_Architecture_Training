import 'dart:convert';


import 'package:login_registration_clone/Data/api_exceptions.dart';

import 'base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService{
  @override
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));
      responseJson = returnResponse(response);
    }catch(e){
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data, {bool sendAsJson = true}) async{
    dynamic responseJson;
    try{
      http.Response response;

      if (sendAsJson) {
        response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        ).timeout(const Duration(seconds: 10));
      } else {
        // Construct query parameters from the data
        response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: data,
        ).timeout(const Duration(seconds: 5));
      }

      responseJson = returnResponse(response);
    }catch(e){
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }

  @override
  Future getPatchApiResponse(String url, data) async{
    dynamic responseJson;
    try{
      http.Response response;

        response = await http.patch(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    }catch(e){
      throw FetchDataException(e.toString());
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
        try{
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        }catch(e){
          dynamic responseJson = response.body;
          return responseJson;
        }
      case 201:
        try{
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        }catch(e){
          dynamic responseJson = response.body;
          return responseJson;
        }
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error occurred while communicating\nStatusCode: ${response.statusCode}');
    }
  }




}