import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Imageview extends StatefulWidget {
  const Imageview({super.key});

  @override
  State<Imageview> createState() => _ImageviewState();
}

class _ImageviewState extends State<Imageview> {
  final imageviewrealtime= FirebaseDatabase.instance.ref("post");
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body:SingleChildScrollView(
        child: StreamBuilder(
          stream: imageviewrealtime.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent?> snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Center(child: Text("Error"),);
            }
            if(snapshot.hasData){
              Map<dynamic, dynamic>? map=snapshot.data!.snapshot.value as Map<dynamic, dynamic>?;
    if (map == null || map.isEmpty) {
    return Center(child: Text("No data available"));
    }
            return Column(children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                shrinkWrap: true,
                children: List.generate(snapshot.data!.snapshot.children.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(map.values.toList()[index]["title"].toString()),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0),),
                      ),
                    ),
                  );
                },),
              ),
            ],);
          }
          else{return SizedBox();}}
        ),
      ) ,
    );
  }
}
