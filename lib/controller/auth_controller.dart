

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/firebase_const.dart';

class AuthController extends GetxController{


  //login
  Future<UserCredential?>loginMethod({email,password,context}) async{
    UserCredential? userCredential;

    try{
      await auth.signInWithEmailAndPassword(email: email,password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());

    }
    return userCredential;
  }
  // signup

  Future<UserCredential?>SignUpMethod({required String email,required String password,context}) async{
    UserCredential? userCredential;


    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
  //storingDataMethod
storeUserData({name,password,email}) async {
  DocumentReference store = await firestore.collection(usersCollection).doc(
      currentUser!.uid);
  store.set({
    'name': name,
    'password': password,
    'email': email,
    'imageUrl': ''
  });
}
  signOutMethod(context) async {
    try{
    await auth.signOut();

  }catch(e){
    VxToast.show(context, msg: e.toString());
  }

}
}