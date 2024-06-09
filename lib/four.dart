import 'package:firebase_base/five.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () { Navigator.of(context).pop(); },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Create New Pin',
                    style: GoogleFonts.jost(
                      textStyle: TextStyle(
                        color: Color(0xFF202244),
                        fontSize: 21.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 70.h,
              ),
              Text(
                'Add a Pin Number to Make Your \n       Account more Secure',
                style: GoogleFonts.mulish(
                  textStyle: TextStyle(
                    color: Color(0xFF545454),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 90.h,
              ),
              OtpTextField(borderRadius: BorderRadius.circular(10),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),SizedBox(height: 90.h,),
              TextButton(
                onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen5())); },
                child: Container(
                  width: 200.w,
                  height: 60.h,
                  decoration: ShapeDecoration(
                      color: Color(0xFF0961F5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  ),child: Center(
                    child: Text(
                    'Continue',
                    style:GoogleFonts.jost(textStyle:  TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.w600,
                    ),),
                                  ),
                  ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
