import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/ViewModel/OrderViewModel/user_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../../Model/OrdersModels/users.dart';

class UserListLayout extends StatelessWidget {
  const UserListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final userListProvider = Provider.of<UserListViewModel>(context, listen: false);

    return ListView.builder(
      itemCount: userListProvider.userList.length,
      itemBuilder: (context, index) {
        Users user = userListProvider.userList[index];
        return Column(
          children: [
            ListTile(
              title: CustomWidgets.customText(text: 'Name: ${user.userName}', fontWeight: FontWeight.bold),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidgets.customText(text: 'Email: ${user.userName}', fontWeight: FontWeight.bold),
                  CustomWidgets.customText(text: 'Phone No. ${user.phoneNumber}', fontWeight: FontWeight.bold),
                  CustomWidgets.customText(text: 'Role: ${user.role}', fontWeight: FontWeight.bold),
                  CustomWidgets.customText(text: 'Vehicle Name: ${user.vehicleName}', fontWeight: FontWeight.bold),
                ]
              ),

              // You can display more user details here if needed
            ),
            const SizedBox(height: 10,),
            const Divider(thickness: 1,)
          ],
        );
      },
    );
  }
}
