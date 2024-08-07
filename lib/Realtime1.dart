import 'package:firebase_base/Realtime2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  final realtime = FirebaseDatabase.instance.ref("Realtimedata");
  TextEditingController realtimecall=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 100.h,),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: TextField(controller: realtimecall,
              maxLines: 7,decoration: InputDecoration(hintText: "Type here",border: OutlineInputBorder()),),
          ),
          SizedBox(height: 100.h,),
          GestureDetector(onTap: (){
            final id =DateTime.now().microsecondsSinceEpoch.toString();
            realtime.child(id).set({"id":id,"tittle":realtimecall.text}).then((onValue){realtimecall.clear();
              Fluttertoast.showToast(msg: "Successfully");})
                .onError((error, StackTrace){Fluttertoast.showToast(msg: "error");});
            // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen6()));
            },
            child: Container(
              width: 200.w,
              height: 70.h,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),),
              child: Center(
                child: Text(
                  "Send",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 28.sp)),
                ),
              ),),
          ),
          SizedBox(height: 100.h,),
          GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen6())); },
            child: Container(
              width: 100.w,
              height: 50.h,
              decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Center(
                child: Text(
                  "View",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 24.sp)),
                ),
              ),),
          )
        
        ],),
      ),
    );
  }
}
