
import 'OrderEntity/billing_address.dart';
import 'OrderEntity/product_details.dart';

class OrderModel{

  late int id;
  late String customerName;
  late int productQuantity;
  late double totalMrp;
  late double totalDiscount;
  late double payAmount;
  late String orderStatus;
  late BillingAddress billingAddress;
  late List<ProductDetail> productList;

  OrderModel({required this.id, required this.customerName, required this.productQuantity,required this.totalMrp, required this.totalDiscount, required this.payAmount, required this.orderStatus, required this.billingAddress, required this.productList});

}