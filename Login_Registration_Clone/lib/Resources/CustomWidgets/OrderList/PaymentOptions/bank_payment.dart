import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/custom_drop_down.dart';
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
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 5),
                child: Consumer<PaymentSummaryViewModel>(builder: (context, bankProvider, child) {
                  return CustomDropDown(
                      list: bankProvider.bankList,
                      dropDownValue: bankProvider.selectedBank,
                      onChange: (onChange) => bankProvider.onToggleChange(onChange),
                      borderRadius: 5,
                      bgColor: AppColor.darkIndigo,
                      textColor: AppColor.whiteColor);
                }),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      label: const Text('Cheque Number'),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: (){
                  paymentSummaryViewModel.changeDate(context: context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF293770))
                ),
                child: const Text(
                  'Pick Date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Consumer<PaymentSummaryViewModel>(builder: (context, bankProvider, child) {
                  return Text(
                    '${bankProvider.selectedDate.day}-${bankProvider.selectedDate.month}-${bankProvider.selectedDate.year}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF293770),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        const SizedBox(height: 5,),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      label: const Text('Name'),
                      fillColor: const Color(0xFFFFFFFF),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF293770))
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
