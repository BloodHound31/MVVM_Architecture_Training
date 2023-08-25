import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:login_registration_clone/Repository/ProductRepository/OrderRepository.dart';
import 'package:provider/provider.dart';

import '../../Utils/Routes/routes_name.dart';
import '../../Utils/utils.dart';
import 'CartViewModel.dart';

class CheckoutViewModel with ChangeNotifier{



  final List<String> _paymentOptions = ['Cash On Delivery', 'Credit Card', 'Debit Card', 'Google Pay'];
  late String _dropDownValue;
  final OrderRepository _myRepo = OrderRepository();

  List<String> get paymentOption => _paymentOptions;
  String get dropDownValue => _dropDownValue;

  CheckoutViewModel(){
    _dropDownValue = _paymentOptions.first;
  }

  void onChange(String? value){
    _dropDownValue = value!;
    notifyListeners();
  }

  //Change The products stocks
  Future<void> updateStocksApi(BuildContext context) async{

    final cartProvider = Provider.of<CartViewModel>(context, listen: false);
    List<Map<String, dynamic>> stocksData = [];
    for (var cartItem in cartProvider.items.values.toList()) {
      stocksData.add({
        'productName': cartItem.productName,
        'availableStocks': cartItem.product!.productDetails!.initialStocks! - cartItem.productQuantity!,
      });
      cartItem.product!.productDetails!.initialStocks = cartItem.product!.productDetails!.availableStock;
    }
    cartProvider.clearCart();
    _myRepo.changeAvailableStockApi(stocksData).then((value){
      Utils.toastMessage('Updated');
      Navigator.pushNamed(context, RouteNames.productListRoute);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });

  }

  //Creating User
  Future<void> createUserDetails(dynamic userName, dynamic address)async{

    dynamic data = {
      'userName': userName,
      'userAddress': address,
      'paymentOption': _dropDownValue
    };
    _myRepo.userDetailsPostApi(data).then((value){
      Utils.toastMessage('Your user is created');
      //Navigator.pushNamed(context, RouteNames.loginRoute);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  //Creating Bill
  Future<void> createBill(dynamic userName, BuildContext context, dynamic payAmount)async{

    final cartProvider = Provider.of<CartViewModel>(context, listen: false);
    double totalPrice = cartProvider.totalPrice;
    double totalDiscount = cartProvider.totalDiscount;

    dynamic data = {
      'totalMrp': totalPrice,
      'totalDiscount': totalDiscount,
      'payAmount': payAmount,
    };
    _myRepo.createBillPostApi(data, userName).then((value){
      //Utils.toastMessage('Your bill is created');
      //Navigator.pushNamed(context, RouteNames.loginRoute);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


  double calculateDiscountedPrice(BuildContext context) {

    final cartProvider = Provider.of<CartViewModel>(context, listen: false);
    double totalPrice = cartProvider.totalPrice;
    double totalDiscount = cartProvider.totalDiscount;

    if (totalPrice <= 0 || totalDiscount < 0 || totalDiscount > 100) {
      throw ArgumentError("Invalid input values");
    }

    double discountAmount = totalPrice * (totalDiscount / 100);
    double discountedPrice = totalPrice - discountAmount;
    return discountedPrice;
  }

}