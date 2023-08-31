import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/custom_drop_down.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/CheckoutPageWidgets/BillDetails.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/CheckoutPageWidgets/CustomerDetails.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Utils/utils.dart';
import 'package:login_registration_clone/ViewModel/ProductsViewModel/CheckoutViewModel.dart';
import 'package:provider/provider.dart';

import '../../Resources/colors.dart';


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final checkoutViewModel = Provider.of<CheckoutViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColor.darkIndigo,
      appBar: AppBar(
        title: const Text('CheckOut'),
        backgroundColor: AppColor.darkIndigo,
        centerTitle: true,

      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: AppColor.lightIndigo,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.centerLeft ,
                              child: Text(
                                'Customer Details',
                                style: TextStyle(color: AppColor.whiteColor, fontSize: 20, fontWeight: FontWeight.bold),)),
                          const SizedBox(height: 10,),
                          CustomerDetails(
                              nameController: nameController,
                              addressController: addressController
                          ),
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Payment Method',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColor.whiteColor
                              ),
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Consumer<CheckoutViewModel>(builder: (__, ckViewModel, _) => CustomDropDown(
                                  icon: const SizedBox.shrink(),
                                  dropDownHeight: 40,
                                  borderRadius: 5,
                                  textColor: AppColor.whiteColor,
                                  bgColor: AppColor.darkIndigo,
                                  list: ckViewModel.paymentOption,
                                  onChange: (onChange){
                                    ckViewModel.onChange(onChange);
                                  },
                                  dropDownValue: ckViewModel.dropDownValue,
                                ),),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.lightIndigo,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: BillDetails(),
                            ),
                          ),
                          const SizedBox(height: 30,),

                          Row(
                            children: [
                              Expanded(
                                child: CustomWidgets.customElevatedButton(
                                    onPress: (){
                                      if (_formKey.currentState!.validate()) {
                                        String userName = nameController.text;
                                        String address = addressController.text;
                                        double finalPrice = checkoutViewModel.calculateDiscountedPrice(context);
                                        checkoutViewModel.createUserDetails(userName, address);
                                        checkoutViewModel.updateStocksApi(context);
                                          checkoutViewModel.createBill(userName, context, finalPrice);

                                      } else {
                                        // Form is invalid
                                        Utils.toastMessage('Form not filled');
                                      }
                                    },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
