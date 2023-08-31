import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/custom_drop_down.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/payment_summary_view_model.dart';
import 'package:provider/provider.dart';

class BankPayment extends StatefulWidget {
  const BankPayment({super.key});

  @override
  State<BankPayment> createState() => _BankPaymentState();
}

class _BankPaymentState extends State<BankPayment> {
  @override
  Widget build(BuildContext context) {

    final paymentSummaryViewModel = Provider.of<PaymentSummaryViewModel>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Row(
          children: [
            Expanded(flex: 1,child: CustomWidgets.customText(text: 'Cheque No.', fontSize: 17)),
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
          children: [
            Expanded(
              flex: 1,
              child: CustomWidgets.customText(text: 'Cheque Date', fontSize: 17),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Selector<PaymentSummaryViewModel, DateTime>(
                    selector: (_, date) => date.selectedDate,
                    builder: (_, bankProvider, __) {
                      return CustomWidgets.dateBox(
                          text: '${bankProvider.day}-${bankProvider.month}-${bankProvider.year}',
                          onPress: (){
                            paymentSummaryViewModel.changeDate(context: context);
                          },
                      );
                    })
              ),
            )
          ],
        ),
        const SizedBox(height: 50,),
        Row(
          children: [
            Expanded(
              child: CustomWidgets.customElevatedButton(onPress: (){}, text: 'Submit', borderRadius: 10, height: 5),
            ),
          ],
        )
      ],
    );
  }
}
