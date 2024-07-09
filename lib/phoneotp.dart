import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_base/firestore1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Screenphoneotp extends StatefulWidget {
  final String verification;

  const Screenphoneotp({super.key, required this.verification});

  @override
  State<Screenphoneotp> createState() => _ScreenphoneotpState();
}

class _ScreenphoneotpState extends State<Screenphoneotp> {
FirebaseAuth auth =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: OtpTextField(
                borderRadius: BorderRadius.circular(10.r),
                borderWidth: 1,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) async {
                  final credentials = PhoneAuthProvider.credential(
                      verificationId: widget.verification,
                      smsCode: verificationCode);
                  try{
                    await auth.signInWithCredential(credentials);
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen3()));
                  }catch(error){
                    Fluttertoast.showToast(msg: "error");
                  }

                }, // end onSubmit
              ),
            ),
            //  SizedBox(height: 250.h,),
            // Container(
            //   width: 200.w,
            //   height: 60.h,
            //   decoration: ShapeDecoration(
            //       color: Colors.black,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(20))),
            //   child: Center(
            //     child: Text(
            //       'Continue',
            //       style: GoogleFonts.jost(
            //         textStyle: TextStyle(
            //           color: Colors.white,
            //           fontSize: 22.sp,
            //           fontFamily: 'Jost',
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
// OtpTextField(borderRadius: BorderRadius.circular(10.r),borderWidth: 1,
// keyboardType: TextInputType.number,
// inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// numberOfFields: 6,
// borderColor: Color(0xFF512DA8),
// showFieldAsBox: true,
// onCodeChanged: (String code) {
// },
// onSubmit: (String verificationCode){
// showDialog(
// context: context,
// builder: (context){
// return AlertDialog(
// title: Text("Verification Code"),
// content: Text('Code entered is $verificationCode'),
// );
// }
// );
// }, // end onSubmit
//),
