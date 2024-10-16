import 'package:drctc/screens/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:show_hide_password/show_hide_password.dart';

import '../widgets/password.dart';
import '../widgets/username.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  "Enter your credentials for login",
                ),
                const Padding(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 10),
                    child: Username()),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  child: ShowHidePassword(
                    hidePassword: false,
                    passwordField: (hidePassword) {
                      return Password();
                    },
                    iconSize: 18,
                    visibleOnIcon: Icons.remove_red_eye,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey!.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()));
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text("Login Now"),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
                  child: InkWell(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w800),
                    ),
                    //onHover: ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                              color:
                                  Colors.black), // Set style for regular text
                        ),
                        TextSpan(
                          text: "Signup",
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signup()),
                              );
                              if (kDebugMode) {
                                print('Signup tapped');
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
