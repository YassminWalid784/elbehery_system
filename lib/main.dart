import 'package:flutter/material.dart';
import 'features/login_screen/page/login_view.dart';
import 'features/registration/page/register_view.dart';
import 'features/splash_screen/page/splash_view.dart';


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
        LoginView.routeName: (context) =>  LoginView(),
        RegisterView.routeName: (context) =>  RegisterView(),
      },
    );
  }
}
