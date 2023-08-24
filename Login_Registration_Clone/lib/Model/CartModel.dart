import 'package:login_registration_clone/Model/ProductModels/ProductModel.dart';

class CartModel{

  ProductModel? product;
  String? productName;
  double? productPrice;
  double? discountPercent;
  int? productQuantity;

  CartModel(
      {this.product,
        this.productName,
        this.productPrice,
        this.discountPercent,
        this.productQuantity});

}