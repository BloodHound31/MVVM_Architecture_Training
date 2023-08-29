class ProductDetail{

  String productName;
  int productQuantity;
  int cancelQuantity = 0;
  int productPrice;
  late int totalProductPrice;
  late int initialQuantity;
  late int initialTotal;
  late int initialCancel;

  ProductDetail({required this.productName, required this.productQuantity, required this.productPrice}){
    totalProductPrice = totalPrice(productPrice, productQuantity);
    initialQuantity = productQuantity;
    initialTotal = totalProductPrice;
    initialCancel = cancelQuantity;
  }

  int totalPrice(int productPrice, int productQuantity){
    int totalPrice = productPrice * productQuantity;
    return totalPrice;
  }
}