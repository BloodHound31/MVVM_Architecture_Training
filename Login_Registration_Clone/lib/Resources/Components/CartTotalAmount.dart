import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/CartViewModel.dart';
import 'package:provider/provider.dart';

class CartTotalAmount extends StatefulWidget {
  const CartTotalAmount({super.key});

  @override
  State<CartTotalAmount> createState() => _CartTotalAmountState();
}

class _CartTotalAmountState extends State<CartTotalAmount> {


  @override
  Widget build(BuildContext context) {
    final cartModelView = Provider.of<CartViewModel>(context, listen: false);
    if (kDebugMode) {
      print('_CartTotalAmountState building');
    }
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: const Color(0xFF8B9AD8),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.topLeft,
                        child: Selector<CartViewModel, double>(
                            selector: (_, cartProvider) => cartProvider.totalPrice,
                            builder: (_, value, __) {
                              return Text(
                                'Total Amount: $value',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              );
                            },
                        )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 1000,
                      height: 80,
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          cartModelView.proceedToCheckout(context);
                        },
                        icon: const Icon(Icons.check_outlined),
                        label: const Text(
                          'Proceed To Check Out',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              const Color(0xFF293771)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
