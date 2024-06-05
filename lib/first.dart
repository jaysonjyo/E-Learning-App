import 'package:firebase_base/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool ischecked = false;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      width: 220.w,
                      height: 150.h,
                      child: Image.asset("assets/LOGO.png")),
                  Padding(
                    padding: const EdgeInsets.only(right: 150, top: 25),
                    child: Text(
                      'Getting Started.!',
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                        color: Color(0xFF202244),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 35, top: 10),
                    child: Text(
                      'Create an Account to Continue your allCourses',
                      style: GoogleFonts.mulish(
                        textStyle: TextStyle(
                          color: Color(0xFF545454),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Container(
                    width: 350.w,
                    height: 60.h,
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                width: 0.10.w, color: Colors.black12))),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        labelText: "Email",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 350.w,
                      height: 60.h,
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  width: 0.10.w, color: Colors.black12))),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: value == true
                                  ? FaIcon(FontAwesomeIcons.eyeSlash)
                                  : Icon(Icons.remove_red_eye_outlined),
                              onPressed: () {
                                setState(() {
                                  value = !value;
                                });
                              },
                            ),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            labelText: "Password"),
                      )

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 140),
                      //   child: IconButton(
                      //       icon: value == true
                      //           ? FaIcon(FontAwesomeIcons.eyeSlash)
                      //           : Icon(Icons.remove_red_eye_outlined),
                      //       onPressed: () {
                      //         setState(() {
                      //           value = !value;
                      //         });
                      //       }),
                      // ),

                      ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 15,
                            child: Checkbox(
                              value: ischecked,
                              activeColor: Colors.white,
                              shape: CircleBorder(),
                              checkColor: Colors.green,
                              onChanged: (value) {
                                setState(
                                  () {
                                    ischecked = !ischecked;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Text(
                          "Agree to Terms & Con",
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    width: 350.w,
                    height: 60.h,
                    decoration: ShapeDecoration(
                        color: Color(0xFF0961F5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                                width: 0.10.w, color: Colors.black12))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Row(
                        children: [
                          Text(
                            "Sign Up",
                            style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 90),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20.r,
                              child: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Or Continue With",
                    style: GoogleFonts.mulish(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130, top: 20),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.asset("assets/a.png")),
                        SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.asset("assets/b.png"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 90, top: 20),
                    child: Row(
                      children: [
                        Text(
                          'Already have an Account? ',
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Color(0xFF545454),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              height: 0.h,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Screen2()));
                          },
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Color(0xFF0961F5),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              height: 0.h,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
