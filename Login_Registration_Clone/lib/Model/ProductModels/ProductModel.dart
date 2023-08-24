class ProductModel {
  int? productId;
  String? productName;
  String? productDiscription;
  double? productPrice;
  double? sellerDiscount;
  String? sellerName;
  String? productCategories;
  ProductDetails? productDetails;

  ProductModel(
      {this.productId,
        this.productName,
        this.productDiscription,
        this.productPrice,
        this.sellerDiscount,
        this.sellerName,
        this.productCategories,
        this.productDetails});



  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productDiscription = json['productDiscription'];
    productPrice = json['productPrice'];
    sellerDiscount = json['sellerDiscount'];
    sellerName = json['sellerName'];
    productCategories = json['productCategories'];
    productDetails = json['productDetails'] != null
        ? ProductDetails.fromJson(json['productDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['productDiscription'] = productDiscription;
    data['productPrice'] = productPrice;
    data['sellerDiscount'] = sellerDiscount;
    data['sellerName'] = sellerName;
    data['productCategories'] = productCategories;
    if (productDetails != null) {
      data['productDetails'] = productDetails!.toJson();
    }
    return data;
  }
}

class ProductDetails {
  int? id;
  int? availableStock;
  String? sellerName;
  double? sellingPrice;
  double? costPrice;

  ProductDetails(
      {this.id,
        this.availableStock,
        this.sellerName,
        this.sellingPrice,
        this.costPrice});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    availableStock = json['availableStock'];
    sellerName = json['sellerName'];
    sellingPrice = json['sellingPrice'];
    costPrice = json['costPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['availableStock'] = availableStock;
    data['sellerName'] = sellerName;
    data['sellingPrice'] = sellingPrice;
    data['costPrice'] = costPrice;
    return data;
  }
}