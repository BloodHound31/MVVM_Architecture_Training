import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ViewModel/OrderViewModel/order_summary_view_model.dart';
import '../../../colors.dart';
import '../../custom_widgets.dart';

class CreditPayment extends StatelessWidget {
  const CreditPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(flex: 1,child: CustomWidgets.customText(text: 'Amount', fontSize: 17)),

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
