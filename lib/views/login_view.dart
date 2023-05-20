import 'package:flutter/material.dart';
import 'package:moneyup/constants/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String email = "mike@gmail.com";
  String password = "mike123";

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              color: const Color(0xFF1E1E1E),
              child: const Padding(
                padding: EdgeInsets.only(top: 80.0, bottom: 30),
                child: Column(
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        color: Color(0xFFE4E4E7),
                        fontFamily: 'SF Pro Display',
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "Please login",
                      style: TextStyle(
                        color: Color(0xFFE4E4E7),
                        fontFamily: 'SF Pro Display',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF), // Set the background color
                border: Border.all(
                  color: const Color(0xFFE1EFFE), // Set the border color
                  width: 1, // Set the border width
                ),
                borderRadius: const BorderRadius.only(
                  topLeft:
                      Radius.circular(35.0), // Set border radius on top left
                  topRight:
                      Radius.circular(35.0), // Set border radius on top right
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, left: 7.0, right: 7.0, bottom: 0.0),
                      child: TextField(
                        controller: _email,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                            color: Color(0xFFA1A1AA),
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0,
                              20.0, 20.0), // Set the content padding
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFD4D4D8),
                                width: 1.0), // Set the border color and width
                            borderRadius: BorderRadius.circular(
                                12.0), // Set the border radius
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          height: 1.0,
                          color: Color(0xFF18181B), // Set the hint text color
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 14.0, left: 7.0, right: 7.0, bottom: 0.0),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFFA1A1AA),
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0,
                              20.0, 20.0), // Set the content padding
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFD4D4D8),
                                width: 1.0), // Set the border color and width
                            borderRadius: BorderRadius.circular(
                                12.0), // Set the border radius
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          height: 1.0,
                          color: Color(0xFF18181B), // Set the hint text color
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, right: 15.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              forgotPasswordRoute,
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            foregroundColor: const Color(0xFFFFFFFF),
                          ),
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF2A2A2A),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 8.0, right: 8.0, bottom: 12.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (email == _email.text &&
                              password == _password.text) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              homeRoute,
                              (route) => false,
                            );
                          } else {
                            //give error message
                          }
                        },
                        style: TextButton.styleFrom(
                          fixedSize: const Size(398.0, 60.0),
                          backgroundColor: const Color(0xFF79F959),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.0,
                            color: Color(0xFF18181B),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            left: 20.0,
                            right: 12.0,
                            bottom: 5.0,
                          ),
                          child: Container(
                            width: 147, // Set the desired width
                            height: 1, // Set the desired height
                            color: const Color(
                                0xFFD4D4D8), // Set the desired color
                          ),
                        ),
                        const Text(
                          "or",
                          style: TextStyle(
                            color: Color(0xFF71717A),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            left: 12.0,
                            right: 12.0,
                            bottom: 5.0,
                          ),
                          child: Container(
                            width: 147, // Set the desired width
                            height: 1, // Set the desired height
                            color: const Color(
                                0xFFD4D4D8), // Set the desired color
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(340.0, 60.0),
                          backgroundColor:
                              const Color(0xFF1877F2), // Set background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Set border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10), // Set horizontal padding
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.only(),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FaIcon(
                              FontAwesomeIcons
                                  .facebookF, // Set the desired Font Awesome icon
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        label: const Padding(
                          padding: EdgeInsets.only(left: 45, right: 70),
                          child: Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white, // Set text color
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(340.0, 60.0),
                          backgroundColor:
                              const Color(0xFF18181B), // Set background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Set border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10), // Set horizontal padding
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.only(),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FaIcon(
                              FontAwesomeIcons
                                  .apple, // Set the desired Font Awesome icon
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        label: const Padding(
                          padding: EdgeInsets.only(left: 55, right: 85),
                          child: Text(
                            'Continue with Apple',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white, // Set text color
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(340.0, 60.0),
                          backgroundColor:
                              const Color(0xFFD4D4D8), // Set background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // Set border radius
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10), // Set horizontal padding
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.only(),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FaIcon(
                              FontAwesomeIcons
                                  .google, // Set the desired Font Awesome icon
                              size: 20,
                            ),
                          ),
                        ),
                        label: const Padding(
                          padding: EdgeInsets.only(left: 47, right: 80),
                          child: Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontFamily: 'Satoshi',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xFF18181B), // Set text color
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70.0, bottom: 14.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            registerRoute,
                            (route) => false,
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          foregroundColor: const Color(0xFFFFFFFF),
                        ),
                        child: const Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: Color(0xFF18181B),
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                text: "Sign up!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
