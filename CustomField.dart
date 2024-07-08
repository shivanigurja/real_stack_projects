import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomField{
  static Widget CustomTextField(TextEditingController controller, String text, IconData iconData, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:1, vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            // color:Colors.blue,
          ),
        ),
      ),
    );
  }

  static Widget CustomButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        onPressed: voidCallback,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ),
    );
  }

  static Future<void> CustomAlertBox(BuildContext context, String text) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
