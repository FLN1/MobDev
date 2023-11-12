import 'package:countriez/components/customTF.dart';
import 'package:countriez/components/signInButton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool viewPass = true;
  //controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in
  void signIn() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: Colors.blueGrey[300],
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Icon(
                      Icons.map_outlined,
                      size: 100,
                    ),
                    SizedBox(height: 50),
                    Text('CountriEZ',
                        style: TextStyle(fontSize: 35, color: Colors.black54)),

                    const SizedBox(height: 20),

                    //Email Text Field
                    customTF(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      suffix: Icon(Icons.email_sharp),
                    ),
                    const SizedBox(height: 20),
                    //Password
                    customTF(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: viewPass,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            viewPass = !viewPass;
                          });
                        },
                        icon: Icon(
                            viewPass ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),

                    const SizedBox(height: 20),
                    signInButton(
                      onTap: signIn,
                    ),
                  ],
                ),
              ),
            )));
  }
}
