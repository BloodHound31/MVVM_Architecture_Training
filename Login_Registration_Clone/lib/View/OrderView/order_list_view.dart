import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/Components/custom_drop_down.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/order_list_layout.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_view_model.dart';
import 'package:provider/provider.dart';


class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final orderListViewModel = Provider.of<OrderListViewModel>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColor.darkIndigo,
      appBar: AppBar(
        title: const Text('Order History'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.darkIndigo,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.lightIndigo,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child:TextField(
                      onChanged: (value) => orderListViewModel.searchProduct(value),
                      decoration: InputDecoration(
                          fillColor: AppColor.whiteColor,
                          filled: true,
                          labelText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Consumer<OrderListViewModel>(builder: (_, orderList, child) {
                      return CustomDropDown(
                          icon: const SizedBox.shrink(),
                          dropDownHeight: 40,
                          list: orderList.statusList,
                          dropDownValue: orderList.selectedStatus,
                          onChange: (value) => orderList.sortByStatus(value),
                          borderRadius: 10,
                          bgColor: AppColor.darkIndigo,
                          textColor: AppColor.whiteColor
                      );
                    },
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
            const OrderListLayout(),
          ],
        ),
      ),
    );
  }
}
