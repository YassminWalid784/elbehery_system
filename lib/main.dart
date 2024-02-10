import 'package:elbehery_system/screens/login_screen/login.dart';
import 'package:elbehery_system/screens/registration/registration_screen.dart';
import 'package:elbehery_system/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elbehery App',
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        Login.routeName: (context) => Login(),
        RegistrationScreen.routeName: (context) => const RegistrationScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),

      },
    );
  }
}
