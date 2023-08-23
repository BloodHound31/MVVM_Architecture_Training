import 'dart:convert';

import 'package:login_registration_clone/Data/Network/ResponseApiService.dart';
import 'package:login_registration_clone/Data/Network/base_Api_Service.dart';
import 'package:login_registration_clone/Model/ProductModels/ProductModel.dart';


import '../../Resources/application_urls.dart';

class ProductRepository{

  final BaseApiService _apiService = NetworkApiService() as BaseApiService;

  Future<List<ProductModel>> fetchProductListApi() async{

    try{
      dynamic response = await _apiService.getGetApiResponse(ApplicationUrls.productListEndPoint);
      final List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> products = data.map((item) => ProductModel.fromJson(item)).toList();
      return products;
    }
    catch(e)
    {
      throw e;
    }

  }
}