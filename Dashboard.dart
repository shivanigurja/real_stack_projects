import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoggingPage.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LogginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Dashbord",style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),

      body: Center(
        child: Text("WellCome To The Deshbord Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logout,
        tooltip: 'Logout',
        child: const Icon(Icons.logout),
      ),
    );
  }
}
