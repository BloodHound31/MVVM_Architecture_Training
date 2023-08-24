import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/product_list_layout.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/Products_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../Data/Response/status.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(builder: (__, productViewModel, _){
      final productList = productViewModel.productList;
      //productViewModel.fetchProductListApi();

      switch (productList.status){
        case Status.Loading:
          return const CircularProgressIndicator();
        case Status.Error:
          return Text('Error: ${productList.message}');
        case Status.Completed:
          return ProductListLayout(
            productList: productViewModel.numberOfProductsOnPage,
          );
        default:
          return const Text('Unknown state');
      }

    });
  }
}
