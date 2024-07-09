import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
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

          Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 700.h,
            width: 500.w,
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, position) {
                return ListTile(
                  title: Text("gfhb",
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
                      onPressed: () {},
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
          )
        ],
      ),
    ),)
    ,
    );
  }
}
