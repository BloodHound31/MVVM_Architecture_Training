import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:login_registration_clone/Resources/colors.dart';
import 'package:login_registration_clone/Utils/Paths/assets_path.dart';
class LoadingState extends StatefulWidget {
  const LoadingState({super.key});

  @override
  State<LoadingState> createState() => _LoadingStateState();
}

class _LoadingStateState extends State<LoadingState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.backGroundColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.backGroundPath),
            fit: BoxFit.cover,
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox( height: 5,),
            Text('Loading...', style:TextStyle(color: AppColor.whiteColor),),
          ],
        ),
      ),
    );
  }
}
