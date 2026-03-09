import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  const storage = FlutterSecureStorage();
  String? email = await storage.read(key: "email");

  runApp(
    MyApp(
      startScreen: email == null ? LoginScreen() : HomeScreen(),
    ),
  );
}

class MyApp extends StatelessWidget {

  final Widget startScreen;

  const MyApp({super.key, required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure Storage App',
      debugShowCheckedModeBanner: false,
      home: startScreen,
    );
  }
}