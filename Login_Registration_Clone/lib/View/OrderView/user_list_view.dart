import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/OrderList/user_list_layout.dart';

import '../../Resources/colors.dart';
import '../../Utils/Paths/assets_path.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image:AssetImage(AssetPath.tiltedBackgroundPath),
              fit: BoxFit.cover
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              color: AppColor.whiteColor,
            ),
            child: const UserListLayout(),
          ),
        ),
      ),
    );
  }
}
