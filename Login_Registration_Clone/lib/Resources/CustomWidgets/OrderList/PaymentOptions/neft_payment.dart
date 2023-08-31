import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ViewModel/OrderViewModel/order_summary_view_model.dart';
import '../../../../ViewModel/OrderViewModel/payment_summary_view_model.dart';
import '../../../Components/custom_drop_down.dart';
import '../../../colors.dart';
import '../../custom_widgets.dart';

class NEFTPayment extends StatefulWidget {
  const NEFTPayment({super.key});

  @override
  State<NEFTPayment> createState() => _NEFTPaymentState();
}

class _NEFTPaymentState extends State<NEFTPayment> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(flex: 1,child: CustomWidgets.customText(text: 'NEFT Amount', fontSize: 17)),

            Expanded(flex: 1,
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColor.searchBoxColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Center(
                    child: Selector<OrderSummaryViewModel, int>(
                      selector: (_, provider) => provider.payAmount(),
                      builder: (_,value,__) {
                        return CustomWidgets.customText(text: value.toString(), fontWeight: FontWeight.bold);
                      },
                    ),
                  ),
                ),
            ),

          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(flex: 1,child: CustomWidgets.customText(text: 'NEFT No.', fontSize: 17)),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CustomWidgets.chequeNumberField(textField: ''),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 1,child:CustomWidgets.customText(text: 'Bank Name', fontSize: 17)),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 5),
                child: Consumer<PaymentSummaryViewModel>(builder: (context, bankProvider, child) {
                  return CustomDropDown(
                      icon: const Icon(Icons.arrow_drop_down, size: 30, color: AppColor.propsColor,) ,
                      dropDownHeight: 30,
                      list: bankProvider.bankList,
                      dropDownValue: bankProvider.selectedBank,
                      onChange: (onChange) => bankProvider.onToggleChange(onChange),
                      borderRadius: 10,
                      bgColor: AppColor.searchBoxColor,
                      textColor: AppColor.propsColor);
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 50,),
        Row(
          children: [
            Expanded(
              child: CustomWidgets.customElevatedButton(onPress: (){}, text: 'Submit', borderRadius: 10, height: 5),
            ),
          ],
        ),
      ],
    );
  }
}
