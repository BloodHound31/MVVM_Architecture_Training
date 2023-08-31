import 'package:flutter/material.dart';
import 'package:login_registration_clone/Resources/CustomWidgets/custom_widgets.dart';
import 'package:login_registration_clone/Utils/Paths/assets_path.dart';

import '../../Resources/colors.dart';

class LoaderSummary extends StatelessWidget {
  const LoaderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Loader Summary'),
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
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomWidgets.customText(text: 'Loader Name:', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 5,),
                CustomWidgets.customText(text: 'Collection:', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 5,),
                CustomWidgets.customText(text: 'Total Cash:', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 5,),
                CustomWidgets.customText(text: 'Total Cheque:', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 5,),
                CustomWidgets.customText(text: 'No. of Bill.:', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 5,),
                CustomWidgets.customText(text: 'Cancelled Bills:', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 5,),
                CustomWidgets.customText(text: 'Signed Amount:', fontSize: 20, fontWeight: FontWeight.bold),
                const SizedBox(height: 30,),
                const Divider(thickness: 1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
