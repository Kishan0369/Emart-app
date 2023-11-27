import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/Auth_screen/signup_screen.dart';
import 'package:emart_app/views/homescreen/home_scr.dart';
import 'package:emart_app/widgets_common/appgo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/lists.dart';
import '../../widgets_common/Custom_textfield.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/our_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight*0.1).heightBox,
              applogowidget(),
              20.heightBox,
              "Login to $appname".text.fontFamily(bold).white.size(22).make(),
              20.heightBox,
              Column(
                children: [
                  customTextfield(hint:emailHint,title:email,isPass: false),
                  customTextfield(hint:passwordHint,title:password,isPass: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child:TextButton(onPressed: (){}, child:forgetPass.text.make(),)),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth-50).make(),

                    ourButton(color: redColor,title: login,textColor: whiteColor,onPress: (){
                      Get.to(()=>const HomeScreen());
                    } ).box.width(context.screenWidth-50).make(),
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(color: lightGolden,title: signup,textColor:redColor,onPress: (){
                    Get.to(()=> SignupScreen());
                  } ).box.width(context.screenWidth-50).make(),

                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialiconList[index],
                        width: 30,),
                      ),
                    ))
                  )





                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-50).shadowSm.make(),





            ],
          ),
        ),
      )
    );
  }
}
