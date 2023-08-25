import 'package:flutter/material.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/payment_summary_view_model.dart';
import 'package:provider/provider.dart';

class HalfCashOnly extends StatefulWidget {
  const HalfCashOnly({super.key});

  @override
  State<HalfCashOnly> createState() => _HalfCashOnlyState();
}

class _HalfCashOnlyState extends State<HalfCashOnly> {

  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final paymentSummary = Provider.of<PaymentSummaryViewModel>(context, listen: false);

    return SizedBox(
        height: 224,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 5),
                      child: TextField(
                        controller: amountController,
                        onChanged: (value) => paymentSummary.pendingAmount(value, context),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            label: const Text('Amount will be paying'),
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
              const SizedBox(width: 7,),

              const SizedBox(height: 5),
              Text("Amount to be paid: ${amountController.text}"),
              const SizedBox(height: 5,),
              Selector<PaymentSummaryViewModel, int>(
                selector: (_, selector) => selector.remainingAmount,
                builder: (__, value, _) => Text('Remaining Amount: $value'),),
              const SizedBox(height: 5,),
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
          ),
        )
    );
  }
}
