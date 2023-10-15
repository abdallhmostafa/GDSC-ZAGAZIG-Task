import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final PreferredSizeWidget appBar = AppBar(
    title: const Text(
      "Login Page",
      style: TextStyle(fontSize: 20.0),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: height * 0.7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    const FlutterLogo(
                      size: 200.0,
                      style: FlutterLogoStyle.horizontal,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: userNameValidate,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      validator: passwordValidate,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue, fontSize: 18.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0))),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            SizedBox(
              height: height * 0.1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New User?  ",
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Create Account",
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? passwordValidate(password) {
    if (password!.isNotEmpty && password.length >= 8) {
      return null;
    }
    return 'Please Enter Password!';
  }

  String? userNameValidate(userName) {
    if (userName!.isNotEmpty &&
        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(userName)) {
      return null;
    }
    return 'Please Enter Correct User Name!';
  }
}
