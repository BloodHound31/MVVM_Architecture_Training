import 'package:flutter/material.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:provider/provider.dart';

class CashOnly extends StatelessWidget {

  const CashOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        height: 110,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<OrderSummaryViewModel>(builder: (context, value, child) => Text('Amount To Be Paid:\nRs.${value.payAmount()}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF293770)),),),
            const SizedBox(height: 30,),
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
            ),
          ],
        ),
      ),
    );
  }
}
