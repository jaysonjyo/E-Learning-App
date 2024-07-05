import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Screenphoneotp extends StatefulWidget {
  final String verification;
  const Screenphoneotp({super.key, required this.verification});

  @override
  State<Screenphoneotp> createState() => _ScreenphoneotpState();
}

class _ScreenphoneotpState extends State<Screenphoneotp> {
  @override
  Widget build(BuildContext context) {
    String _code="";
    return Scaffold(
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: PinFieldAutoFill(
              decoration: UnderlineDecoration(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: _code,
              onCodeSubmitted: (code) {},
              onCodeChanged: (code) {
                if (code!.length == 6) {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              },
            ),
          ),
          SizedBox(height: 250.h,),
          TextButton(
            onPressed: () {  },
            child: Container(
              width: 200.w,
              height: 60.h,
              decoration: ShapeDecoration(
                  color: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
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
        ],),
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