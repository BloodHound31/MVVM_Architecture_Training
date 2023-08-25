import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/CartTotalAmount.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/CartViewModel.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF293770),
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        backgroundColor: const Color(0xFF293771),
      ),
      body: Column(
        children: [
          Expanded(
            //flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: cartProvider.items.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.items.values.toList()[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: const Color(0xFF8C9BDA),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        title: Text(
                          cartItem.productName.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price ${cartItem.productPrice}',
                            ),
                            const SizedBox(height: 5),
                            Text(
                                'discount: ${cartItem.discountPercent}%'),
                            const SizedBox(height: 5),
                            Text(
                                'Quantity: ${cartItem.productQuantity}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: const Color(0xFF293771),
                                  child: IconButton(
                                      onPressed: () {
                                        cartProvider.addItems(product: cartItem.product!);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 18,
                                      )),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: const Color(0xFF293771),
                                  child: IconButton(
                                      onPressed: () {
                                        cartProvider.subtractItems(product: cartItem.product!);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 18,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const CartTotalAmount(),
        ],
      ),
    );
  }
}
