import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_base/Realtime1.dart';
import 'package:firebase_base/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  TextEditingController editingController = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection("Datas").snapshots();
  final ref= FirebaseFirestore.instance.collection("Datas");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: firestore,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text(
                        'error',
                        style: TextStyle(color: Colors.purple),
                      );
                    }
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 700.h,
                          width: 500.w,
                          child: ListView.separated(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, position) {
                              return ListTile(
                                title: Text(
                                  snapshot.data!.docs[position]["title"]
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                trailing: Wrap(children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Expanded(
                                            child: AlertDialog(
                                              title: Text("Edit"),
                                              content: TextField(
                                                controller: editingController,
                                                decoration: InputDecoration(
                                                    hintText: "....",
                                                    border:
                                                        OutlineInputBorder()),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('CANCEL'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    ref
                                                        .doc(snapshot
                                                            .data!
                                                            .docs[position]
                                                                ["idcard"]
                                                            .toString())
                                                        .update({
                                                      "title":
                                                          editingController.text
                                                    }).then((onValue) {
                                                      editingController.clear();
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              'Updated Successfully');
                                                    }).onError((error,
                                                            stackTrace) {
                                                      Fluttertoast.showToast(
                                                          msg: 'Error');
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Submit'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ref
                                          .doc(snapshot
                                              .data!.docs[position]["idcard"]
                                              .toString())
                                          .delete();
                                    },
                                    icon: Icon(Icons.delete),
                                  )
                                ]),
                              );
                            },
                            separatorBuilder: (context, position) {
                              return SizedBox(
                                height: 5.h,
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Row(
                  children: [
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen5()));
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
                            "Next",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 28.sp)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>UploadImage()));},
                      child: Container(
                        width: 200.w,
                        height: 70.h,
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),),),
                        child: Center(
                          child: Text(
                            "Upload Image",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 25.sp)),
                          ),
                        ),),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
