import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';
import 'dart:developer';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethod = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or Join a meeting",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: /*Lottie.asset("assets/images/onboardinglottieanimation.json"),*//*Image.asset('assets/images/onboarding.jpg'),*/ Lottie.network('https://assets9.lottiefiles.com/packages/lf20_ot09abmx.json'),
          ),
          CustomButton(
            text: 'Google Sign in',
            onPresses: () async {
              bool res = await _authMethod.signInWithGoogle(context);
              log("res : $res");
              if (res) {
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}
