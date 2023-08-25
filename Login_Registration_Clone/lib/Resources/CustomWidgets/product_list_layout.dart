import 'package:flutter/material.dart';
import 'package:login_registration_clone/Model/ProductModels/ProductModel.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/CartViewModel.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/Products_ViewModel.dart';
import 'package:provider/provider.dart';

import '../Components/PageButtons.dart';


class ProductListLayout extends StatefulWidget {

  final List<ProductModel>? productList;
  //final int? selectedNumberOfProducts;
  const ProductListLayout({super.key, required this.productList});

  @override
  State<ProductListLayout> createState() => _ProductListLayoutState();
}


class _ProductListLayoutState extends State<ProductListLayout> {

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductViewModel>(context, listen: false);
    final cartProvider = Provider.of<CartViewModel>(context, listen: false);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: PageView.builder(
            controller: pageController,
            itemCount: (productProvider.productFoundList.length/productProvider.selectedNumberOfProducts).ceil(),
            itemBuilder: (context, pageIndex){
              productProvider.pageSorting(pageIndex);
              return ListView.builder(
                itemCount: productProvider.numberOfProductsOnPage.length,
                itemBuilder: (context, index) {
                  //Getting the final price
                  dynamic productFinalPrice = productProvider.calculateFinalPrice(productProvider.numberOfProductsOnPage[index].productPrice, productProvider.numberOfProductsOnPage[index].sellerDiscount);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: const Color(0xFFEEEEEE),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(productProvider.numberOfProductsOnPage[index].productName.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product Description: ${productProvider.numberOfProductsOnPage[index].productDiscription}'),
                              Text('Product MRP: ${productProvider.numberOfProductsOnPage[index].productPrice.toString()}'),
                              Text('Discount by seller: ${productProvider.numberOfProductsOnPage[index].sellerDiscount.toString()}%'),
                              Text('Final Price: ${productFinalPrice.toString()}'),
                              Text('Seller: ${productProvider.numberOfProductsOnPage[index].sellerName}'),
                              Text('Category: ${productProvider.numberOfProductsOnPage[index].productCategories}'),
                              Selector<ProductViewModel, int?>(
                                  selector: (_, provider) => provider.numberOfProductsOnPage[index].productDetails!.availableStock,
                                  builder: (__, value, _) => Text('Available Stocks: ${value.toString()}'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: const Color(0xFF293771),
                                    child: IconButton(
                                        onPressed: () {
                                          cartProvider.addItems(product: productProvider.numberOfProductsOnPage[index]);
                                          productProvider.decreaseAvailableStocks(index);
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          size: 18,
                                          color: Colors.white,
                                        )),
                                  ),
                                  const SizedBox(width: 5),
                                   Selector<CartViewModel, int?>(
                                       selector: (_, cartProvider) => cartProvider.items.containsKey(productProvider.numberOfProductsOnPage[index].productName)
                                           ? cartProvider.items[productProvider.numberOfProductsOnPage[index].productName]!.productQuantity : 0,
                                      builder: (__, value, _) => Text(value.toString()),
                                   ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: const Color(0xFF293771),
                                    child: IconButton(
                                        onPressed: () {
                                          cartProvider.subtractItems(product: productProvider.numberOfProductsOnPage[index]);
                                          productProvider.increaseAvailableStocks(index);
                                          },
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 18,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
       PageButtons(pageController: pageController),
      ],
    );
  }
}
