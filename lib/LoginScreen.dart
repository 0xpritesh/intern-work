import 'package:flutter/material.dart';
import 'package:systemic_55/SignUp.dart';
import 'package:systemic_55/bottomnavbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _showPassword = true;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email Address",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  "User Password",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  cursorColor: Colors.black,
                  obscureText: _showPassword,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _showPassword = !_showPassword;
                          },
                        );
                      },
                      child: Icon(
                        !_showPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  controller: passwordController,
                  validator: (value) => value!.toString().trim().isEmpty
                      ? 'Enter your password'
                      : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      height: 18,
                      width: 12,
                      child: Transform.scale(
                        scale: .7,
                        child: Checkbox(
                          value: _rememberMe,
                          activeColor: Colors.black,
                          focusColor: Colors.black,
                          side: const BorderSide(color: Colors.black, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                _rememberMe = value ?? false;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Remember me",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "Forgot Password",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
                const SizedBox(height: 24),

                // Sign in Button
                MaterialButton(
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.black,
                  elevation: 0,
                  minWidth: double.infinity,
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomnavBar()));
                  },
                  onLongPress: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // ignore: prefer_typing_uninitialized_variables
                      var authController;
                      await authController.signInWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                        context: context,
                      );
                    }
                  },
                ),
                const SizedBox(height: 20),
                // Sign up

                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have a account?",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          " Sign up",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(" now",
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
