import 'package:flutter/cupertino.dart';

import '../../Model/OrdersModels/OrderEntity/billing_address.dart';
import '../../Model/OrdersModels/OrderEntity/product_details.dart';
import '../../Model/OrdersModels/order_model.dart';



class OrderSummaryViewModel with ChangeNotifier{

  late List<ProductDetail> _productSummary = [];
  late BillingAddress _billingAddress;
  late String _customerName;
  late int _billNumber;
  late DateTime _billDate;
  late String _vehicleName;
  late List<ProductDetail> _foundProductSummary;
  bool _showWidget = false;


  List<ProductDetail> get productSummary => _productSummary;

  DateTime get billDate => _billDate;
  String get vehicleName => _vehicleName;
  int get billNumber => _billNumber;
  List<ProductDetail> get foundProductSummary => _foundProductSummary;

  BillingAddress get billingAddress => _billingAddress;
  bool get showWidget => _showWidget;
  String get customerName => _customerName;



  OrderSummaryViewModel(){
    payAmount();
  }


  void initializeValue(OrderModel orderModel){

    _billingAddress = orderModel.billingAddress;
    _productSummary = orderModel.productList;
    _customerName = orderModel.customerName;
    _billNumber = orderModel.id;
    _billDate = orderModel.billDate;
    _vehicleName = orderModel.vehicleName;
    _foundProductSummary = _productSummary;
    notifyListeners();
  }

  int totalPrice(int productPrice, int productQuantity){
    int totalPrice = productPrice * productQuantity;
    return totalPrice;
  }

  //Search Products
  void searchProduct(String enteredKeyword) {
    List<ProductDetail> result = [];
    if (enteredKeyword.isEmpty) {
      result = _productSummary;
    } else {
      result = _productSummary
          .where((element) =>
      element.productName
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    _foundProductSummary = result;
    notifyListeners();
  }



  void decreaseProduct(int index){
    if(_productSummary.isNotEmpty && index >= 0 && index < _productSummary.length) {
      if(_productSummary[index].productQuantity > 0){
        _productSummary[index].productQuantity--;
        _productSummary[index].cancelQuantity++;
        _productSummary[index].totalProductPrice = totalPrice(_productSummary[index].productPrice, _productSummary[index].productQuantity);
      }
      notifyListeners();
    }
  }




  void increaseProduct(int index){

    if(_productSummary.isNotEmpty && index >= 0 && index < _productSummary.length) {
      if(_productSummary[index].productQuantity < _productSummary[index].initialQuantity){
        _productSummary[index].productQuantity++;
        _productSummary[index].cancelQuantity--;
        _productSummary[index].totalProductPrice = totalPrice(_productSummary[index].productPrice, _productSummary[index].productQuantity);
      }
    }
    notifyListeners();

  }
  //
  void goToDefault(int index){
    if(_productSummary.isNotEmpty) {
      _productSummary[index].productQuantity = _productSummary[index].initialQuantity;
      _productSummary[index].totalProductPrice = _productSummary[index].initialTotal;
      _productSummary[index].cancelQuantity = _productSummary[index].initialCancel;
    }
    notifyListeners();
  }

  void updateSummary(int index){
    if(_productSummary.isNotEmpty) {
      _productSummary[index].initialQuantity = _productSummary[index].productQuantity;
      _productSummary[index].initialTotal = _productSummary[index].totalProductPrice;
      _productSummary[index].initialCancel = _productSummary[index].cancelQuantity;
    }
    notifyListeners();
  }

  void toggleWidget(){
    _showWidget = !_showWidget;
    notifyListeners();
  }

  int payAmount(){

    int payAmount = 0;
    for (var element in _productSummary) {
      payAmount += element.totalProductPrice;
    }
    return payAmount;

  }

}