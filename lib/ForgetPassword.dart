import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: email,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: "Enter your email", border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          GestureDetector(onTap: () async {
            await auth.sendPasswordResetEmail(email: email.text).then((
                onValue) {
              Fluttertoast.showToast(msg: "otp send",textColor: Colors.red);
            }).onError((error, StackTrace) {Fluttertoast.showToast(msg: "error",textColor: Colors.red);});
          },
            child: Container(
              width: 200.w,
              height: 70.h,
              decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Center(
                child: Text(
                  "Send OTP",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 24.sp)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
