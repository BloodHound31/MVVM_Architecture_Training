import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/payment_summary.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/product_summary_layout.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:provider/provider.dart';


class OrderSummaryView extends StatefulWidget {
  const OrderSummaryView({super.key});

  @override
  State<OrderSummaryView> createState() => _OrderSummaryViewState();
}

class _OrderSummaryViewState extends State<OrderSummaryView> {
  @override
  Widget build(BuildContext context) {
    final orderSummaryViewModel = Provider.of<OrderSummaryViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF29376F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF29376F),
        elevation: 0.0,
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: const BoxDecoration(
          color: Color(0xFF8B9AD8),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Billing Address',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF29376F)
                  ),
                ),
                const SizedBox(height: 20),
             Text('${orderSummaryViewModel.billingAddress.buildingName}, ${orderSummaryViewModel.billingAddress.streetName}, ${orderSummaryViewModel.billingAddress.townName}, ${orderSummaryViewModel.billingAddress.cityName}, ${orderSummaryViewModel.billingAddress.stateName}, ${orderSummaryViewModel.billingAddress.pinCode}',
                  style:const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF29376F),
                  ),),
                const SizedBox(height: 10,),
                const Divider( color: Color(0x8029376F), thickness: 1,),
                const SizedBox(height: 15,),
                Row(
                    children: [
                      const Text(
                        'Product Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF29376F)
                        ),
                      ),
                      IconButton(
                          onPressed: (){
                            orderSummaryViewModel.toggleWidget();
                          },
                          icon: const Icon(Icons.edit, size: 16,))
                    ]
                ),
                const SizedBox(height: 10,),
                const SizedBox(
                  width: double.infinity,
                  child: ProductSummary(),
                ),
                const SizedBox(height: 10,),
                Selector<OrderSummaryViewModel, int>(
                  selector: (_, orderDetailsProvider) => orderDetailsProvider.payAmount(),
                  builder: (_, value, __) =>  Text('Total Amount: $value', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF29376E)),),),
                const Divider(color: Color(0x8029376F), thickness: 1,),
                const SizedBox(
                  width: double.infinity,
                  height: 700,
                  child: PaymentSummary(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
