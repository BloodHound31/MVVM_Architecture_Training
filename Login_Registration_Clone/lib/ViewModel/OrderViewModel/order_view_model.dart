import 'package:flutter/material.dart';
import 'package:login_registration_clone/Model/OrdersModels/order_model.dart';

import '../../Model/OrdersModels/OrderEntity/billing_address.dart';
import '../../Model/OrdersModels/OrderEntity/product_details.dart';


class OrderListViewModel with ChangeNotifier{

  final List<OrderModel> _orderList = [
    OrderModel(id: 1, totalMrp: 300, totalDiscount: 50, payAmount: 100, orderStatus: 'Pending', customerName: 'Customer A', productQuantity: 5,
        billingAddress: BillingAddress(buildingName: 'Shop-13 Amar Building', streetName: 'Main Carter Road', townName: 'Borivali West', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400092),
        productList: [ProductDetail(productName: 'Bath Soap', productQuantity: 10, productPrice: 50), ProductDetail(productName: 'Detergent', productQuantity: 20, productPrice: 30)]),

    OrderModel(id: 2, totalMrp: 500, totalDiscount: 100, payAmount: 400, orderStatus: 'Pending', customerName: 'Customer B', productQuantity: 10,
        billingAddress: BillingAddress(buildingName: 'Shop No.1 Sheetal Park', streetName: 'Sundar Nagar', townName: 'Borivali West', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400092),
        productList: [ProductDetail(productName: 'Maggie', productQuantity: 10, productPrice: 80), ProductDetail(productName: 'ToothBrush', productQuantity: 15, productPrice: 40)]),

    OrderModel(id: 3, totalMrp: 500, totalDiscount: 100, payAmount: 400, orderStatus: 'PartialCancelled', customerName: 'Customer C', productQuantity: 10,
        billingAddress: BillingAddress(buildingName: 'Shop No. 37 Ajanta Square Mal', streetName: 'L.T Road', townName: 'Borivali West', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400092),
        productList: [ProductDetail(productName: 'Potato Chips', productQuantity: 40, productPrice: 20), ProductDetail(productName: 'Cheese', productQuantity: 20, productPrice: 15)]),

    OrderModel(id: 4, totalMrp: 900, totalDiscount: 200, payAmount: 700, orderStatus: 'Full Cancel', customerName: 'Customer D', productQuantity: 10,
        billingAddress: BillingAddress(buildingName: 'Shop No.2, daya benkhat poul', streetName: 'Dattapada Rd', townName: 'Borivali East', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400066),
        productList: [ProductDetail(productName: 'Bread', productQuantity: 20, productPrice: 40), ProductDetail(productName: 'Cold Drink', productQuantity: 20, productPrice: 20)]),

    OrderModel(id: 5, totalMrp: 1000, totalDiscount: 100, payAmount: 900, orderStatus: 'Delivered', customerName: 'Customer E', productQuantity: 5,
        billingAddress: BillingAddress(buildingName: ' Annapurna mart Shop no 2 Esspee tower ', streetName: 'Dattapada Rd', townName: 'Borivali East', cityName: 'Mumbai', stateName: 'Maharashtra', pinCode: 400066),
        productList: [ProductDetail(productName: 'Dairy Milk', productQuantity: 30, productPrice: 20), ProductDetail(productName: 'Oreo', productQuantity: 20, productPrice: 35)])
  ];


  final List<String> _statusList = ['All', 'Pending', 'Full Cancel', 'Delivered', 'PartialCancelled'];

  List<OrderModel> _filteredList = [];

  String _selectedStatus = '';



  List<OrderModel> get orderList => _orderList;

  List<OrderModel> get filteredList => _filteredList;

  String get selectedStatus => _selectedStatus;

  List<String> get statusList => _statusList;

  OrderListViewModel(){
    _filteredList = _orderList;
    _selectedStatus = _statusList.first;
  }


  void searchProduct(String enteredKeyword) {
    List<OrderModel> result = [];
    if (enteredKeyword.isEmpty) {
      result = _orderList;
    } else {
      result = _orderList
          .where((element) =>
          element.customerName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    _filteredList = result;
    notifyListeners();
  }

  void sortByStatus(String? status) {
    _selectedStatus = status!;
    if(status == 'All'){
      _filteredList = _orderList;
    }else{
      _filteredList = _orderList.where((item) => item.orderStatus == status).toList();
    }
    notifyListeners();
  }

  void changeStatus(String? status){
    _selectedStatus = status!;
    notifyListeners();
  }

  Color getStatusColorChange(String status){
    switch(status){
      case 'Pending':
        return Colors.red;
      case 'PartialCancelled':
        return Colors.yellow;
      case 'Full Cancel':
        return Colors.orange;
      case 'Delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget customStatus(int index){
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: getStatusColorChange(_filteredList[index].orderStatus),
          radius: 7,
        ),
        const SizedBox(width: 5,),
        Text(_filteredList[index].orderStatus)
      ],
    );
  }

}