import 'package:flutter/material.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/Products_ViewModel.dart';
import 'package:provider/provider.dart';


class PageButtons extends StatelessWidget {
  final PageController pageController;
  const PageButtons({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(builder: (context, provider, child) {
      return Visibility(
        visible: (provider.productList.data!.length > provider.selectedNumberOfProducts),
        //Next and previous button
        child: Container(
          height: MediaQuery.of(context).size.height * 0.04,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (pageController.page! > 0) {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ButtonStyle(
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF8B9AD8)),
                ),
                child: const Text(
                  'Previous',
                  style: TextStyle(color: Color(0xFF29376F)),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  if (pageController.page! <
                      (provider.productList.data!.length / provider.selectedNumberOfProducts).ceil() - 1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ButtonStyle(
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF8B9AD8)),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Color(0xFF29376F)),
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      );
    },
    );
  }
}
