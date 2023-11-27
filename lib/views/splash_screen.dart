import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/Auth_screen/loginscreen.dart';
import 'package:emart_app/widgets_common/appgo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {

  //creating a method to change screen
  const SplashScreen({Key? key}) : super(key: key);


  @override

  State<SplashScreen> createState() => _SplashScreenState();


}


class _SplashScreenState extends State<SplashScreen> {
  ChangeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(()=>LoginScreen());
    });
  }
  @override
  initState() {
    ChangeScreen();
    super.initState();
    // Add listeners to this class
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(

          children: [
            Align(alignment: Alignment.topLeft,child: Image.asset(icSplashBg,width: 300)),25.heightBox,
            applogowidget(),
            30.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,


          ],
        ),

      )
    );
  }
}
