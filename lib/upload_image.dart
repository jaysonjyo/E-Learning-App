import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print("No image Picked");
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print("No image Picked");
      }
    });
  }
final databaseReference  =FirebaseDatabase.instance.ref("post");
  FirebaseStorage storage = FirebaseStorage.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 200.h,
          ),
          Center(
              child: GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r)))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                getImageGallery();

                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 100.w,
                                height: 80,
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            width: 1, color: Colors.black))),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.image,
                                        size: 35,
                                      ),
                                      Text(
                                        "Gallery",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 21.sp)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                getImageCamera();

                              },
                              child: Container(
                                width: 100.w,
                                height: 80,
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(
                                            width: 1, color: Colors.black))),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.camera,
                                        size: 35,
                                      ),
                                      Text(
                                        "Camera",
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 21.sp)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 300.w,
              height: 300.h,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.w, color: Colors.black)),
                  shadows: [BoxShadow(color: Colors.black, blurRadius: 4)]),
              child: image != null
                  ? Image.file(image!.absolute)
                  : Icon(
                      Icons.image,
                      size: 35,
                    ),
            ),
          )),
          SizedBox(
            height: 100.h,
          ),
          GestureDetector(onTap: () async {
            final id= DateTime.now().microsecondsSinceEpoch.toString();
            Reference ref = storage.ref('/foldername/' + id);
            UploadTask uploadtask=ref.putFile(image!.absolute);
             await Future.value(uploadtask).then((onValue) async {
               dynamic newurl = await ref.getDownloadURL();
               databaseReference.child(id).set({"id":id,"title":newurl.toString()}).then((onValue){

                 setState(() {
                   image=null;
                 });


                 Fluttertoast.showToast(
                     msg:
                     'Successfully');
               }).onError((error, StackTrace){
                 Fluttertoast.showToast(
                     msg: 'Error');
               });
             });


          },
            child: Container(
              width: 200.w,
              height: 50.h,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Upload",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 21.sp)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
