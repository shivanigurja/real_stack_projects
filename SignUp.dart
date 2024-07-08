
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:real_stick_app/screens/CustomField.dart';

import 'Dashboard.dart';
import 'LoggingPage.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController ConfirmpasswordController=TextEditingController();
  bool isPassVisible= true;
  signup(String email,String password)async{
    if(email==""&&password==""){
      CustomField.CustomAlertBox(context,"Enter Required Field");
    }
    else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
        );
      } on FirebaseAuthException catch (ex) {

        return CustomField.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue,
        title: Text("Sign Up Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomField.CustomTextField(emailController,"Email",Icons.mail,false),
          SizedBox(height: 10,),
          CustomField.CustomTextField(passwordController,"Password",Icons.remove_red_eye_sharp,isPassVisible),
          SizedBox(height: 10,),
          CustomField.CustomTextField(ConfirmpasswordController," Confirm Password",Icons.password,false),
          SizedBox(
            height: 30,
          ),
          CustomField.CustomButton(() {
            signup(emailController.text.toString(),passwordController.text.toString());
          },"Signup"),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Already have an account?",style: TextStyle(fontSize: 18),),
              ),
              TextButton(onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>LogginPage(),
                  ),
                );
              },

                child:Text("Login",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),),
            ],
          ),
        ],

      ),

    );
  }
}


