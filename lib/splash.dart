import 'package:firebase_base/first.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen1()));
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset("assets/LOGO.png")),
    );
  }
}
