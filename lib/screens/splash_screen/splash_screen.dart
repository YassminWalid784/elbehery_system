import 'dart:async';
import 'package:elbehery_system/screens/login_screen/login.dart';
//import 'package:elbehery_system/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  static const String routeName = "/";

  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(
          context,
          Login.routeName,
        );
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/LogoElbehery.jpg",
              height: mediaQuery.height,
              width: mediaQuery.width,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
