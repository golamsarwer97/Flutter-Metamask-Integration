// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_dsl/screens/add_wallet.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _animation;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 8),
  //   );
  //   _animation = Tween<double>(begin: 1.0, end: 2).animate(_controller);
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b202b),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => MyHomePage(),
            ),
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/dsl.png'),
          ),
        ),
      ),
    );
  }
}
