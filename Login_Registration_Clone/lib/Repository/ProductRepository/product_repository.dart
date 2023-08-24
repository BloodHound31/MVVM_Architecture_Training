import 'package:login_registration_clone/Data/Network/base_api_service.dart';
import 'package:login_registration_clone/Data/Network/ResponseApiService.dart';
import 'package:login_registration_clone/Model/ProductModels/ProductModel.dart';


import '../../Resources/application_urls.dart';

class ProductRepository{

  final BaseApiService _apiService = NetworkApiService();

  Future<List<ProductModel>> fetchProductListApi() async{

    try{
      dynamic response = await _apiService.getGetApiResponse(ApplicationUrls.productListEndPoint);
      final List<dynamic> data = response;
      List<ProductModel> products = data.map((item) => ProductModel.fromJson(item)).toList();
      products.sort((a, b) => a.productName!.compareTo(b.productName!));
      return products;
    }
    catch(e)
    {
      rethrow;
    }

  }
}