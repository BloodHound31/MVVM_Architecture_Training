import 'package:flutter/material.dart';

import '../../Model/CartModel.dart';
import '../../Model/ProductModels/ProductModel.dart';

class CartViewModel with ChangeNotifier{

  final Map<String, CartModel> _items = {};
  // double _totalPrice = 0.0;

  Map<String, CartModel> get items => _items;
  // double get totalPrice => _totalPrice;

  void addItems({required ProductModel product}){
    final productName = product.productName;
    if(_items.containsKey(productName)){
      _items.update(productName!, (value) => CartModel(product: value.product,productName: value.productName, productPrice: value.productPrice, discountPercent: value.discountPercent, productQuantity: value.productQuantity! +1));
      notifyListeners();
    }else{
      _items.putIfAbsent(productName! , () => CartModel(product: product, productName: productName, productPrice: product.productPrice, discountPercent: product.sellerDiscount, productQuantity: 1));
      notifyListeners();
    }
  }


  void subtractItems({required ProductModel product}){
    final productName = product.productName;
    if(_items.containsKey(productName) && _items[productName]!.productQuantity! >= 2){
      _items.update(productName!, (value) => CartModel(product: value.product,productName: value.productName, productPrice: value.productPrice, discountPercent: value.discountPercent, productQuantity: value.productQuantity! -1));
      notifyListeners();
    }else{
      _items.remove(productName);
      notifyListeners();
    }
  }


  //Get the total price
  double get totalPrice{
    double finalPrice = 0.0;
    _items.forEach((key, value) {
      finalPrice += value.productPrice! * value.productQuantity!;
    });
    return finalPrice;
  }

  //Get the total price
  // double get totalDiscount{
  //   double totalDiscount = 0.0;
  //   _items.forEach((key, value) {
  //     totalDiscount += value.discountPercent;
  //   });
  //
  //   return totalDiscount;
  // }

}