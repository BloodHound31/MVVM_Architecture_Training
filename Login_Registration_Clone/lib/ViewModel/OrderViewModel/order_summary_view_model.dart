import 'package:flutter/cupertino.dart';

import '../../Model/OrdersModels/OrderEntity/billing_address.dart';
import '../../Model/OrdersModels/OrderEntity/product_details.dart';
import '../../Model/OrdersModels/order_model.dart';



class OrderSummaryViewModel with ChangeNotifier{

  late List<ProductDetail> _productSummary = [];
  late BillingAddress _billingAddress;
  bool _showWidget = false;

  List<ProductDetail> get productSummary => _productSummary;


  BillingAddress get billingAddress => _billingAddress;
  bool get showWidget => _showWidget;



  OrderSummaryViewModel(){
    payAmount();
  }


  void initializeValue(OrderModel orderModel){

    _billingAddress = orderModel.billingAddress;
    _productSummary = orderModel.productList;
    notifyListeners();
  }

  int totalPrice(int productPrice, int productQuantity){
    int totalPrice = productPrice * productQuantity;
    return totalPrice;
  }



  void decreaseProduct(int index){
    if(_productSummary.isNotEmpty && index >= 0 && index < _productSummary.length) {
      if(_productSummary[index].productQuantity > 0){
        _productSummary[index].productQuantity--;
        _productSummary[index].totalProductPrice = totalPrice(_productSummary[index].productPrice, _productSummary[index].productQuantity);
      }
      notifyListeners();
    }
  }




  void increaseProduct(int index){

    if(_productSummary.isNotEmpty && index >= 0 && index < _productSummary.length) {
      if(_productSummary[index].productQuantity < _productSummary[index].initialQuantity){
        _productSummary[index].productQuantity++;
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
    }
    notifyListeners();
  }

  void updateSummary(int index){
    if(_productSummary.isNotEmpty) {
      _productSummary[index].initialQuantity = _productSummary[index].productQuantity;
      _productSummary[index].initialTotal = _productSummary[index].totalProductPrice;
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