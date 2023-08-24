import 'package:flutter/foundation.dart';
import 'package:login_registration_clone/Data/Response/api_response.dart';
import 'package:login_registration_clone/Repository/ProductRepository/product_repository.dart';

import '../../Model/ProductModels/ProductModel.dart';

class ProductViewModel with ChangeNotifier{

  final _myRepo = ProductRepository();

  //Getting List of products
  ApiResponse<List<ProductModel>> _productList = ApiResponse.loading();
  List<ProductModel> _productFoundList = [];
  List<ProductModel> _numberOfProductOnPage = [];

  //For Sorting the list
  final List<String> _sortList = ['A-Z','Z-A'];
  late String _sortValue;

  //For pageNumbers
  late List<int> _numberOfProducts = [];
  int _selectedNumberOfProducts = 1;

  //Getters for all the variables
  ApiResponse<List<ProductModel>> get productList => _productList;
  List<ProductModel> get productFoundList => _productFoundList;
  List<String> get sortList => _sortList;
  String get sortValue => _sortValue;
  List<int> get numberOfProducts => _numberOfProducts;
  int get selectedNumberOfProducts => _selectedNumberOfProducts;
  List<ProductModel> get numberOfProductsOnPage => _numberOfProductOnPage;

  ProductViewModel(){
    fetchProductListApi();
    _sortValue = _sortList.first;
  }

  setProductList(ApiResponse<List<ProductModel>> response){
    _productList = response;
    notifyListeners();
  }

  //Get products from Api
  Future<void> fetchProductListApi() async{

    setProductList(ApiResponse.loading());
    _myRepo.fetchProductListApi().then((value){
      _productFoundList = value;
      _numberOfProductOnPage = _productFoundList;
      _numberOfProducts = List<int>.generate(value.length, (i) => i + 1);
      _selectedNumberOfProducts = _numberOfProducts.length;
      setProductList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print('Error $error');
      }
      setProductList(ApiResponse.error(error.toString()));
    });

  }


  //Sort the products
  void onSortOrderChanged(String? value) {

    _sortValue = value!;
    if (value == 'A-Z') {
      _productFoundList.sort((a, b) => a.productName!.compareTo(b.productName!));
    } else if (value == 'Z-A') {
      _productFoundList.sort((a, b) => b.productName!.compareTo(a.productName!));
    }
    notifyListeners();
  }


  //Search Products
  void searchProduct(String enteredKeyword) {
    List<ProductModel> result = [];
    if (enteredKeyword.isEmpty) {
      result = _productList.data!;
    } else {
      result = productList.data!
          .where((element) =>
      element.productName!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()) ||
          element.productCategories!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    _productFoundList = result;
    notifyListeners();
  }

  //Page dropdown
  void changePage(int? enteredNumber) {
    _selectedNumberOfProducts = enteredNumber!;
    notifyListeners();
  }

  void pageSorting(int index){
    final int startIndex = index * _selectedNumberOfProducts;
    final int endIndex =
    (startIndex + _selectedNumberOfProducts < _productFoundList.length)
        ? startIndex + _selectedNumberOfProducts
        : _productFoundList.length;
    _numberOfProductOnPage =  _productFoundList.sublist(startIndex, endIndex);
  }


  //For calculating final price
  double? calculateFinalPrice(double? productPrice, double? discountPercentage) {
    double discountAmount = productPrice! * (discountPercentage! / 100);
    double finalPrice = productPrice - discountAmount;
    return finalPrice;
  }

}