import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/order_view_model.dart';
import 'package:provider/provider.dart';

import '../../Resources/CustomWidgets/OrderList/order_list_layout.dart';
import '../../Utils/Paths/assets_path.dart';


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
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Order History'),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions:[
          PopupMenuButton(
              itemBuilder: (BuildContext context)
              {
                return orderListViewModel.popupMenuItems;
              },
              onSelected: (choice) => orderListViewModel.onChoice(choice, context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
              ),
              splashRadius: 20,
              offset: const Offset(0, 50),
              icon: const Icon(Icons.notifications_none_outlined)

          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
        ]
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.tiltedBackgroundPath),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            onChanged: (value) => orderListViewModel.searchProduct(value),
                            style: const TextStyle(fontSize: 14,color: AppColor.propsColor, fontFamily: 'JoannaSansNovaBook'),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade500),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                fillColor: AppColor.whiteColor,
                                filled: true,
                                labelText: 'Search....',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 40.0, right: 10),
                                  child: Icon(Icons.search),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  height: 700,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.whiteColor,
                  ),
                    child: const OrderListLayout()
                )
              ],
            ),
          ),
          ),
        ),
      );
  }
}
