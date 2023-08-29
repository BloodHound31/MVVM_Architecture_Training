import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/custom_drop_down.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/payment_summary_view_model.dart';
import 'package:provider/provider.dart';

class PartialPayment extends StatefulWidget {
  const PartialPayment({super.key});

  @override
  State<PartialPayment> createState() => _PartialPaymentState();
}

class _PartialPaymentState extends State<PartialPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 5),
      height: 600,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Consumer<PaymentSummaryViewModel>(builder: (__, value, _) {
                  return CustomDropDown(
                      dropDownHeight: 40,
                      list: value.paymentOption,
                      dropDownValue: value.selectedPaymentOption,
                      onChange: (onChange) => value.switchPartialPaymentWidget(onChange),
                      borderRadius: 5,
                      bgColor: AppColor.darkIndigo,
                      textColor: AppColor.whiteColor
                  );
                },
                )
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Selector<PaymentSummaryViewModel, Widget>(
              selector: (_, partialPayment) => partialPayment.partialPaymentWidget,
              builder: (__, widget, _) => widget,
          ),
        ],
      ),
    );
  }
}
