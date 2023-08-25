import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/ProductListFormat.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/Products_ViewModel.dart';
import 'package:provider/provider.dart';

import '../../Resources/Components/custom_drop_down.dart';
import '../../Utils/Routes/routes_name.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}


class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {

    final productsProvider = Provider.of<ProductViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFF293770),
      //Drawer
      drawer: Drawer(
        backgroundColor: const Color(0xFFFFFFFF),
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                accountName: Text('accountName'),
                accountEmail: Text('accountEmail')),
            ListTile(
              leading: Icon(Icons.login, color: Colors.grey.shade600),
              title: Text(
                'Login',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_rounded, color: Colors.grey.shade600),
              title: Text('Cart', style: TextStyle(color: Colors.grey.shade600)),
              onTap: () {
                Navigator.pushNamed(context, RouteNames.cartPageRoute);
              },
            )
          ],
        ),
      ),
      //AppBar
      appBar: AppBar(
        title: const Text('My Store'),
        backgroundColor: const Color(0xFF29376F),
        centerTitle: true,
      ),
      // backgroundColor: Colors.grey[900],
      body: SafeArea(
        //Full widget
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search bar
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextField(
                              onChanged: (value) => productsProvider.searchProduct(value),
                              decoration: InputDecoration(
                                  fillColor: const Color(0xFFF1F2EB),
                                  filled: true,
                                  labelText: 'Search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                            ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: Consumer<ProductViewModel>(builder: (__, provider, _) {
                        return CustomDropDown(
                          borderRadius: 50,
                          textColor: AppColor.darkIndigo,
                          bgColor: AppColor.lightIndigo,
                          list: provider.sortList,
                          dropDownValue: provider.sortValue,
                          onChange: (value){
                            provider.onSortOrderChanged(value);
                          },
                        );
                      },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: Consumer<ProductViewModel>(builder: (__, provider, _) {
                        return CustomDropDown(
                          borderRadius: 50,
                          textColor: AppColor.darkIndigo,
                          bgColor: AppColor.lightIndigo,
                          list: provider.numberOfProducts,
                          dropDownValue: provider.selectedNumberOfProducts,
                          onChange: (value){
                            provider.changePage(value);
                          },
                        );
                      },
                      ),
                    )

                  ],
                ),
              ),
              const ProductListView(),
            ],
          ),
        ),
      ),
    );
  }
}
