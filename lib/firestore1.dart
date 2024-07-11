import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_base/firestore_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final firestore=FirebaseFirestore.instance.collection("Datas");
  TextEditingController call= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fill Your Profile',
          style: GoogleFonts.mulish(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(maxLines: 7,controller: call,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                   ),
              ),
            ),
            SizedBox(
                height: 30.h,
            ),

            SizedBox(
              height: 30.h,
            ),

            SizedBox(  height: 30.h,),
            TextButton(
        onPressed: () {
          final idcard=DateTime.now().microsecondsSinceEpoch.toString();
          firestore.doc(idcard).set({"title":call.text,"idcard":idcard}).then((onValue)=>{call.clear(),
          Fluttertoast.showToast(msg: "DatasAdd")
          }).onError((error, stackTrace)=>{
              Fluttertoast.showToast(msg: "Error")}
          );
         // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen4()));
          },
        child: Container(
        width: 350.w,
        height: 60.h,
        decoration: ShapeDecoration(
        color: Color(0xFF0961F5),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        ),),
         child:    Center(
           child: Text(
                'Submit',
                style: GoogleFonts.jost(
               textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
               ),
                ),
              ),
         )
        ),
            ),
            TextButton(
              onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen4()));},
              child: Container(
                width: 200.w,
                height: 70.h,
                decoration: ShapeDecoration(
                    color: Color(0xFF0961F5), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),child: Center(
                  child: Text(
                  'See View',
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
    );
  }
}
