import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/custom_drop_down.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:provider/provider.dart';

import '../../../ViewModel/OrderViewModel/payment_summary_view_model.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Details',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColor.propsColor,
          ),
        ),
        const SizedBox(height: 10,),
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 1, child: CustomWidgets.customText(text: 'Total Amount:', fontSize: 18.0)),
                Expanded(
                  flex: 1,
                  child: Selector<OrderSummaryViewModel, int>(
                      selector: (_, selector) => selector.payAmount(),
                      builder: (_, value, __) => Center(child: CustomWidgets.customText(text: value.toString(), fontSize: 18.0)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(flex: 1, child: CustomWidgets.customText(text: 'Payment Method: ', fontSize: 18.0)),
                Expanded(
                  flex: 1,
                  child: Consumer<PaymentSummaryViewModel>(builder: (context, paymentSummary, child) {
                    return CustomDropDown(
                        icon: const SizedBox.shrink(),
                        dropDownHeight: 30,
                        list: paymentSummary.paymentList,
                        dropDownValue: paymentSummary.selectedMethod,
                        onChange: (value) => paymentSummary.switchWidget(value),
                        borderRadius: 10,
                        bgColor: AppColor.searchBoxColor,
                        textColor: AppColor.propsColor);
                  },
                  ),
                ),
              ],
            )

          ],
        ),
        const SizedBox(height: 35,),
        Consumer<PaymentSummaryViewModel>(builder: (context, value, child) =>  value.paymentDetailsWidget,),
      ],
    );
  }
}
