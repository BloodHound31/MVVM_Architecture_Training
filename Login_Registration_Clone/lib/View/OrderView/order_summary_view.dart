import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/payment_summary.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/product_summary_layout.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Utils/Paths/assets_path.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:provider/provider.dart';

import '../../Resources/colors.dart';


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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(orderSummaryViewModel.customerName),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.tiltedBackgroundPath),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bill Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'JoannaSansNovaBook',
                            color: AppColor.propsColor
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomWidgets.customText(text: 'Retailer Name: ${orderSummaryViewModel.customerName}'),
                      CustomWidgets.customText(text: 'Bill Number: ${orderSummaryViewModel.billNumber}'),
                      CustomWidgets.customText(text: 'Bill Date: ${orderSummaryViewModel.billDate.day}/${orderSummaryViewModel.billDate.month}/${orderSummaryViewModel.billDate.year}'),
                      CustomWidgets.customText(text: 'Vehicle Name: ${orderSummaryViewModel.vehicleName}'),
                      const SizedBox(height: 5),
                      Divider( color: Colors.grey.shade300, thickness: 1,),
                      const Text(
                        'Billing Address',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'JoannaSansNovaBook',
                            color: AppColor.propsColor
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomWidgets.customText(text: '${orderSummaryViewModel.billingAddress.buildingName}, ${orderSummaryViewModel.billingAddress.streetName}, ${orderSummaryViewModel.billingAddress.townName}, ${orderSummaryViewModel.billingAddress.cityName}, ${orderSummaryViewModel.billingAddress.stateName}, ${orderSummaryViewModel.billingAddress.pinCode}'),
                      const SizedBox(height: 10,),
                      Divider( color: Colors.grey.shade300, thickness: 1,),
                      Row(
                          children: [
                            const Text(
                              'Product Summary',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: 'JoannaSansNovaBook',
                                  color: AppColor.propsColor
                              ),
                            ),
                            IconButton(
                                onPressed: (){
                                  orderSummaryViewModel.toggleWidget();
                                },
                                icon: const Icon(Icons.edit, size: 16,))
                          ]
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 30,
                              child: TextField(
                                onChanged: (value) => orderSummaryViewModel.searchProduct(value),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColor.propsColor
                                      )
                                    ),
                                    fillColor: AppColor.searchBoxColor,
                                    filled: true,
                                    labelStyle: const TextStyle(
                                      fontFamily: 'JoannaSansNovaBook',
                                      color: AppColor.propsColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    labelText: 'Search......',
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 5),
                                      child: Icon(Icons.search),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: ProductSummary(),
                      ),
                      const SizedBox(height: 10,),
                      Selector<OrderSummaryViewModel, int>(
                        selector: (_, orderDetailsProvider) => orderDetailsProvider.payAmount(),
                        builder: (_, value, __) =>  Text('Total Amount: $value', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color:AppColor.darkIndigo),),),
                      const Divider(color: AppColor.darkIndigo, thickness: 1,),
                      const SizedBox(
                        width: double.infinity,
                        height: 700,
                        child: PaymentSummary(),
                      )
                    ],
                  ),
                ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
