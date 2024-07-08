import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:real_stick_app/screens/CustomField.dart';

import 'Dashboard.dart';
import 'ForgetPassword.dart';
import 'SignUp.dart';




class LogginPage extends StatefulWidget {
  const LogginPage({super.key});

  @override
  State<LogginPage> createState() => _LogginPageState();
}

class _LogginPageState extends State<LogginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  login(String email,String password)async{
    if(email==""&& password==""){
      return CustomField.CustomAlertBox(context,"Enter Required");
    }
    else{
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
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
    // return const Placeholder();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Text('Login Page'),
          centerTitle: true,
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField.CustomTextField(emailController,"Email",Icons.mail,false),
            SizedBox(height: 10,),
            CustomField.CustomTextField(passwordController,"Password",Icons.remove_red_eye_sharp,false),

            SizedBox(
                height:20
            ),
            CustomField.CustomButton(() {
              login(emailController.text.toString(),passwordController.text.toString());
            },"Login"),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:30),
                  child: Text("Don't have an account?",style: TextStyle(fontSize: 18),),
                ),
                TextButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>SignUp(),
                    ),
                  );
                },

                  child:Text("Sing Up",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),),
              ],
            ),
            SizedBox(height: 10),
            TextButton(onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>ForgetPassword(),
                ),
              );
            }, child:Text("Forget Password??",style: TextStyle(fontSize: 20),))
          ],
        )
    );

  }


}








