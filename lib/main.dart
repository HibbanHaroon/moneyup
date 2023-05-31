import 'package:flutter/material.dart';
import 'package:moneyup/constants/routes.dart';
import 'package:moneyup/views/new_password_view.dart';
import 'package:moneyup/views/post_view.dart';
import 'package:moneyup/views/profile_view.dart';
import 'package:moneyup/views/verification_code_view.dart';
import 'package:moneyup/views/forgot_password_view.dart';
import 'package:moneyup/views/home_view.dart';
import 'package:moneyup/views/login_view.dart';
import 'package:moneyup/views/register_view.dart';
import 'package:moneyup/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF79F959,
          <int, Color>{
            50: Color(0xFFE1F7D3),
            100: Color(0xFFB8ECA3),
            200: Color(0xFF8CE173),
            300: Color(0xFF60D543),
            400: Color(0xFF36C414),
            500: Color(0xFF0CBF00),
            600: Color(0xFF0AAB00),
            700: Color(0xFF089700),
            800: Color(0xFF068200),
            900: Color(0xFF036E00),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      routes: {
        splashRoute: (context) => SplashView(),
        loginRoute: (context) => const LoginView(),
        forgotPasswordRoute: (context) => const ForgotPasswordView(),
        verificationCodeRoute: (context) => const VerificationCodeView(),
        newPasswordRoute: (context) => const NewPasswordView(),
        registerRoute: (context) => const RegisterView(),
        homeRoute: (context) => const HomeView(),
        profileRoute: (context) => const ProfileView(),
        postRoute: (context) => const PostView(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
