import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  final realtimeview=FirebaseDatabase.instance.ref("Realtimedata");
  TextEditingController controler=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [

          Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 700.h,
            width: 500.w,
            child: StreamBuilder(
              stream: realtimeview.onValue,
              builder: (context,
                  AsyncSnapshot<DatabaseEvent> snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(snapshot.hasError){
                  return Center(child: Text("ERROR"),);
                }
                if(snapshot.hasData){

                  Map<dynamic, dynamic>? map = snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;

                  if (map == null || map.isEmpty) {
                    return Center(child: Text("No data available"));
                  }

                return ListView.separated(
                  itemCount: snapshot.data!.snapshot.children.length,
                  itemBuilder: (context, position) {
                    return ListTile(
                      title: Text(map.values.toList()[position]["tittle"].toString(),
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
                                    content: TextField(controller: controler,
                                      decoration: InputDecoration(
                                          hintText: "....",
                                          border:
                                          OutlineInputBorder()),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {

                                          //Navigator.of(context).pop();
                                        },
                                        child: Text('CANCEL'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                         // final id =DateTime.now().microsecondsSinceEpoch.toString();
                                          realtimeview.child(map.values.toList()[position]["id"].toString()).update(
                                              {"tittle":controler.text}).then((onValue) {
                                            controler.clear();
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
                            realtimeview.child(map.values.toList()[position]["id"].toString()).remove();

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
                );}
                else{return SizedBox();}
              }
            ),
          ),
          ),

        ],
      ),
    ),)
    ,
    );
  }
}
