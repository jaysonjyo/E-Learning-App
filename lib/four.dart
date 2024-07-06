import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}
class _Screen4State extends State<Screen4> {
  final firestore =FirebaseFirestore.instance.collection("Datas").snapshots();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: ( BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('error',style: TextStyle(color: Colors.purple),);
                }
    if (snapshot.hasData) {

                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(height: 700.h,
                    width: 500.w,
                    child: ListView.separated(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, position) {
                        return Container(
                          width: 150.w,
                          height: 30.h,
                          color: Colors.white,
                          child: Text(
                            snapshot.data!.docs[position]["title"].toString(),
                            style: TextStyle(color: Colors.black, fontSize: 20.sp),
                          ),
                        );
                      },
                      separatorBuilder: (context, position) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                    ),
                  ),
                );}else{return SizedBox();}
              }
            ),
          ],
        ),
      ),
    );
  }
}
