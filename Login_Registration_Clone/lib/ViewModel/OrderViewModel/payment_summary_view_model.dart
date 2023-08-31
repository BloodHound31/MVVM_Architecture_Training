import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/PartialPayment/HalfCashOnly.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/PaymentOptions/bank_payment.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/PaymentOptions/cash_only.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/PaymentOptions/credit_payment.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/PaymentOptions/neft_payment.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/PaymentOptions/part_payment.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_summary_view_model.dart';
import 'package:provider/provider.dart';

import '../../Resources/CustomWidgets/OrderList/PartialPayment/CashChequePartial.dart';
//import '../../Resources/CustomWidgets/OrderList/PaymentOptions/partial_payment.dart';

class PaymentSummaryViewModel with ChangeNotifier{


  final List<String> _paymentList = ['Cash', 'Cheque', 'NEFT', 'Credit', 'Part Payment'];

  String? _selectedMethod;
  Widget _paymentDetailsWidget = Container();
  Widget _partialPaymentWidget = Container();
  //For bank
  DateTime _selectedDate = DateTime.now();
  final List<String> _bankList = ['HDFC', 'ICICI'];
  late String _selectedBank;

  //For partial Payment
  final List<String> _paymentOption = ['Cash & Cheque', 'Half Cash Only', 'Half Cash & Half Credit'];
  late String? _selectedPaymentOption;
  int _remainingAmount = 0;

  List<String> get paymentList => _paymentList;

  String? get selectedMethod => _selectedMethod;

  Widget get paymentDetailsWidget => _paymentDetailsWidget;

  DateTime get selectedDate => _selectedDate;

  List<String> get bankList => _bankList;

  String get selectedBank => _selectedBank;

  List<String> get paymentOption => _paymentOption;

  String? get selectedPaymentOption => _selectedPaymentOption;

  Widget get partialPaymentWidget => _partialPaymentWidget;

  int get remainingAmount => _remainingAmount;


  PaymentSummaryViewModel(){
  //_selectedMethod = _paymentList.first;
  _selectedBank = _bankList.first;
  _selectedPaymentOption = _paymentOption.first;
  }

  void switchWidget(String? value){
    _selectedMethod = value!;
  switch (_selectedMethod) {
    case 'Cash':
    _paymentDetailsWidget = const CashOnly();
    break;
    case 'Cheque':
    _paymentDetailsWidget = const SizedBox(width: double.infinity, child: BankPayment());
    break;
    case 'NEFT':
    _paymentDetailsWidget = const SizedBox(width: double.infinity, child: NEFTPayment());
    break;
    case 'Part Payment':
    _paymentDetailsWidget =  const PartPayment();
    break;
    case 'Credit':
    _paymentDetailsWidget = const CreditPayment();
    break;
    default:
    _paymentDetailsWidget; // Default case
  }
  notifyListeners();

  }


  //For bank payment
  void onToggleChange(String? bank){
    _selectedBank = bank!;
    notifyListeners();
  }

  void changeDate({required BuildContext context}) async{

    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if(dateTime != null){
      _selectedDate = dateTime;
    }
    notifyListeners();
  }

  void switchPartialPaymentWidget(String? value){
    _selectedPaymentOption = value!;

    switch (_selectedPaymentOption) {
      case 'Cash & Cheque':
        _partialPaymentWidget = const CashChequePartial();
        break;
      case 'Half Cash Only':
        _partialPaymentWidget = const HalfCashOnly();
        break;
      case 'Half Cash & Half Credit':
        _partialPaymentWidget =  const Text('This is Half Cash & Half Credit');
        break;
      default:
        _partialPaymentWidget; // Default case
    }
    notifyListeners();
  }


  void pendingAmount(String text, BuildContext context){

    final orderProvider = Provider.of<OrderSummaryViewModel>(context, listen: false);
    int amount = orderProvider.payAmount();
    if(text.isNotEmpty){
      int payingAmount = int.tryParse(text) ?? 0;
      int pendingAmount = amount - payingAmount;
        _remainingAmount = pendingAmount;
        notifyListeners();
    }
  }



}

