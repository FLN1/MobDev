import 'package:flutter/material.dart';

class signInButton extends StatelessWidget {
  final Function()? onTap;
  const signInButton({super.key, required this.onTap});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(color: Colors.black54),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}
