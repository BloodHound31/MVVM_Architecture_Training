import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/custom_drop_down.dart';
import 'package:login_registration_clone/Resources/colors.dart';
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
          'Payment Summary',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF29376F)
          ),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Consumer<PaymentSummaryViewModel>(builder: (context, paymentSummary, child) {
                return CustomDropDown(
                    list: paymentSummary.paymentList,
                    dropDownValue: paymentSummary.selectedMethod,
                    onChange: (value) => paymentSummary.switchWidget(value),
                    borderRadius: 5,
                    bgColor: AppColor.darkIndigo,
                    textColor: AppColor.whiteColor);
              },
              ),
            ),
            // paymentDetailsWidget,
          ],
        ),
        Consumer<PaymentSummaryViewModel>(builder: (context, value, child) =>  value.paymentDetailsWidget,),
      ],
    );
  }
}
