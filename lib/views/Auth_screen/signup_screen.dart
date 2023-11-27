import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/lists.dart';
import '../../widgets_common/Custom_textfield.dart';
import '../../widgets_common/appgo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/our_button.dart';
import '../homescreen/home_screeen.dart';

class SignupScreen extends StatefulWidget {


  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck=false;
  var controller=Get.put(AuthController());
  //Text Controller
var nameController=TextEditingController();
var emailController=TextEditingController();
var passwordController=TextEditingController();
var passwordRetypeController=TextEditingController();

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
              "Join the  $appname".text.fontFamily(bold).white.size(22).make(),
              20.heightBox,
              Column(
                children: [
                  customTextfield(hint:nameHint,title:nameHint,controller: nameController,isPass: false),
                  customTextfield(hint:emailHint,title:email,controller: emailController,isPass: false),
                  customTextfield(hint:passwordHint,title:password,controller: passwordController,isPass: true),
                  customTextfield(hint:retypwdPassword,title:retypwdPassword,controller: passwordRetypeController,isPass: true),
                  Align(
                      alignment: Alignment.centerRight,
                      child:TextButton(onPressed: (){}, child:forgetPass.text.make(),)),
                  5.heightBox,
                  // ourButton().box.width(context.screenWidth-50).make(),
                  // ourButton(color: redColor,title: signup,textColor: whiteColor,onPress: (){} ).box.width(context.screenWidth-50).make(),



                  
                  
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                        checkColor: whiteColor,
                        value: isCheck, onChanged: (newValue){
                          setState((){
                            isCheck=newValue;
                          });

                      },
                      ),
                      10.widthBox,
                      Expanded(
                        child: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "I agree to the ",style: TextStyle(fontFamily: regular,color: fontGrey)),
                            TextSpan(text: termAndCond,style: TextStyle(fontFamily: regular,color: redColor)),
                            TextSpan(text: privacypolicy,style: TextStyle(fontFamily: regular,color: redColor))
                          ]
                        ),

                        ),

                      ),

                    ],

                  ),
                  ourButton(color: isCheck==true?redColor:lightGrey,title: signup,textColor: whiteColor,onPress: ()async{
                    if(isCheck!=false)
                      {
                        try{
                          await controller.SignUpMethod(context: context,email:emailController.text.toString(),password: passwordController.text.toString()).then((value){
                             controller.storeUserData(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text

                            );
                          }).then((value){
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(()=>HomScreen());
                          });
                        }catch(e){
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());

                        }
                      }
                  } )
                      .box.width(context.screenWidth-50).make(),
                  10.heightBox,
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(
                          fontFamily: bold,
                          color: fontGrey,
                        )
                      ),
                      TextSpan(
                          text: login,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          )
                      )
                    ]
                  )).onTap(() { Get.back(); }),






                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-50).shadowSm.make(),





            ],
          ),
        ),

      ),);
  }
}


