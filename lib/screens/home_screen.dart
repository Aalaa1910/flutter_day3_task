import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final storage = FlutterSecureStorage();

  String name = "";

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {

    String? savedName = await storage.read(key: "name");

    setState(() {
      name = savedName ?? "";
    });

  }

  void logout() async {

    await storage.deleteAll();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Welcome, $name!",
              style: TextStyle(fontSize: 28),
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: logout,
              child: Text("Logout"),
            )

          ],
        ),
      ),
    );
  }
}