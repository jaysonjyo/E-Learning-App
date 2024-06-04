import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'first.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool ischecking = false;
  bool values = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                SizedBox(
                    width: 220.w,
                    height: 150.h,
                    child: Image.asset("assets/LOGO.png")),
                Padding(
                  padding: const EdgeInsets.only(right: 180, top: 25),
                  child: Text(
                    'Let’s Sign In.!',
                    style: GoogleFonts.jost(
                      textStyle: TextStyle(
                        color: Color(0xFF202244),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, top: 10),
                  child: Text(
                    'Login to Your Account to Continue your Courses',
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
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Email",
                            style: GoogleFonts.mulish(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
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
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Password",
                              style: GoogleFonts.mulish(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 140),
                            child: IconButton(
                                icon: values == true
                                    ? FaIcon(FontAwesomeIcons.eyeSlash)
                                    : Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  setState(() {
                                    values = !values;
                                  });
                                }),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: Row(
                    children: [
                      Checkbox(
                        value: ischecking,
                        onChanged: (value) {
                          setState(
                            () {
                              ischecking = !ischecking;
                            },
                          );
                        },
                      ),
                      Text("Remember Me",
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          )),
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
                          "Sign In",
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
                        'Don’t have an Account?',
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
                              MaterialPageRoute(builder: (_) => Screen1()));
                        },
                        child: Text(
                          'SIGN IN',
                          style: GoogleFonts.mulish(
                            textStyle: TextStyle(
                              color: Color(0xFF0961F5),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              height: 0.h,
                              decoration: TextDecoration.underline,
                            ),
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
    );
  }
}
