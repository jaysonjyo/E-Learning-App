import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_base/ForgetPassword.dart';
import 'package:firebase_base/phonepage.dart';
import 'package:firebase_base/firestore1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Signup.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool ischecking = false;
  bool values = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

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
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          labelText: "Email"),
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
                      controller: password,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            icon: values == true
                                ? FaIcon(FontAwesomeIcons.eyeSlash)
                                : Icon(Icons.remove_red_eye_outlined),
                            onPressed: () {
                              setState(() {
                                values = !values;
                              });
                            },
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          labelText: "Password"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180,top: 10),
                    child: GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ForgetPassword()));},
                      child: Text(
                        "ForgetPassword",
                        style: GoogleFonts.lato(
                            textStyle:
                                TextStyle( fontSize: 20.sp,decoration: TextDecoration.underline,color: Colors.red)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30,),
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
                  TextButton(
                    onPressed: () async {
                      await auth
                          .createUserWithEmailAndPassword(
                              email: email.text, password: password.text)
                          .then((value) {
                        Fluttertoast.showToast(msg: 'Successfully registerd');
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => Screen3()));
                      }).onError((error, stackTrace) {
                        Fluttertoast.showToast(msg: error.toString());
                      });
                    },
                    child: Container(
                      width: 350.w,
                      height: 60.h,
                      decoration: ShapeDecoration(
                          color: Colors.black,
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
                    padding: const EdgeInsets.only(left: 110, top: 20),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            signInwithGoogle();
                          },
                          child: SizedBox(
                              width: 70.w,
                              height: 70.h,
                              child: Image.asset("assets/a.png")),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => Screenphone()));
                              },
                              child: CircleAvatar(
                                radius: 23.r,
                                child: Image.asset("assets/d.webp"),
                              )),
                        )
                        // SizedBox(
                        //     width: 70.w,
                        //     height: 70.h,
                        //     child: Image.asset("assets/c.png"))
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
                            'SIGN UP',
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
      ),
    );
  }

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential).then((onValue) {
        Fluttertoast.showToast(msg: "Done");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Screen3()));
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(msg: error.toString());
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}
