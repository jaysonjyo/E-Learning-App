import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_base/phoneotp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Screenphone extends StatefulWidget {
  const Screenphone({super.key});

  @override
  State<Screenphone> createState() => _ScreenphoneState();
}

class _ScreenphoneState extends State<Screenphone> {
  TextEditingController number = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 150),
          child: Column(
            children: [
              Container(
                width: 380.w,
                height: 50.h,
                decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Colors.white70,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),),),
                child: TextField(controller: number,
                  decoration: InputDecoration(focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                      hintText: "Phone Number",prefix: Text("+91"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))
                  ),
                ),
              ),
              SizedBox(height: 190.h,),
              GestureDetector(onTap: () async {
              await  auth.verifyPhoneNumber(
                  phoneNumber: "+91${number.text}",
                    verificationCompleted: (Success){

                    },
                    verificationFailed: (error){
                      Fluttertoast.showToast(msg:error.toString());
                    },
                    codeSent: (String verificationId,int? token) async {
                       final signature = await SmsAutoFill().getAppSignature;
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screenphoneotp(verification: verificationId,)));
                    },
                    codeAutoRetrievalTimeout: (tError){
                      Fluttertoast.showToast(msg:tError.toString());

                    });

              },
                child: Container(
                  width: 280.w,
                  height: 60.h,
                  decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                              width: 0.10.w, color: Colors.black12))),
                  child: Center(
                    child: Text(
                      "Send OTP",
                      style: GoogleFonts.jost(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
