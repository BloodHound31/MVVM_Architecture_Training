import 'package:flutter/foundation.dart';
import 'package:login_registration_clone/Data/Response/api_response.dart';
import 'package:login_registration_clone/Repository/ProductRepository/product_repository.dart';

import '../../Model/ProductModels/ProductModel.dart';

class ProductViewModel with ChangeNotifier{

  final _myRepo = ProductRepository();

  ApiResponse<List<ProductModel>> productList = ApiResponse.loading();

  setProductList(ApiResponse<List<ProductModel>> response){
    productList = response;
    notifyListeners();
  }

  Future<void> fetchProductListApi() async{

    setProductList(ApiResponse.loading());
    _myRepo.fetchProductListApi().then((value){
      setProductList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setProductList(ApiResponse.error(error.toString()));
    });

  }
}