import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'CustomField.dart';



class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController=TextEditingController();
  forgotPassword(String email)async{
    if(email==""){
      return CustomField.CustomAlertBox(context,'Enter an email to Reset Password');
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email:email);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
          centerTitle: true,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField.CustomTextField(emailController,"Email",Icons.mail,false),
            SizedBox(height: 20,),
            CustomField.CustomButton(() {
              forgotPassword(emailController.text.toString());
            },'Reset password')
          ],
        )
    );
  }
}
