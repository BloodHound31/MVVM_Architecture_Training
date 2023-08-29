import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:provider/provider.dart';

class CashOnly extends StatelessWidget {

  const CashOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: 110,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: CustomWidgets.customText(text: 'Cash Amount:', fontSize: 18.0)),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.searchBoxColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Center(
                    child: Consumer<OrderSummaryViewModel>(
                        builder: (_, value, __) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: CustomWidgets.customText(text: value.payAmount().toString(), fontWeight: FontWeight.bold),
                          );
                        }
                    ),
                  ),
                ),
              )
          ],
        ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: CustomWidgets.customElevatedButton(
                      onPress: (){},
                      borderRadius: 10
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
