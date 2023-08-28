import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/CheckoutViewModel.dart';
import 'package:provider/provider.dart';

import '../../../ViewModel/ProductsViewModel/CartViewModel.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Bill Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.whiteColor), ),
        const SizedBox(height: 10,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Title', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('Amount', style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('MRP Amount:'),
            Selector<CartViewModel, double>(
              selector: (_, cartProvider) => cartProvider.totalPrice,
              builder: (_, value, __) => Text(value.toString()),
            )
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Discount:'),
            Selector<CartViewModel, double>(
              selector: (_, cartProvider) => cartProvider.totalDiscount,
              builder: (_, value, __) => Text(value.toString()),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total Amount:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Selector<CheckoutViewModel, double>(
              selector: (_, checkoutProvider) => checkoutProvider.calculateDiscountedPrice(context),
              builder: (_, value, __) => Text('$value', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ],
    );
  }
}
