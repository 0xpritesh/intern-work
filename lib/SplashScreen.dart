import 'package:flutter/material.dart';

import 'package:systemic_55/LoginScreen.dart';
import 'package:systemic_55/SignUp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          const SizedBox(
            height: 600,
            child: Center(
              child: Text("Dating App",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                    child: Text('Log In',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              )),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                    child: Text('Sign In',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ))
        ],
      ),
    );
  }
}
