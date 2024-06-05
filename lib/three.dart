import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  String dropdownvalue = 'Male';

  var items = [
    'Male',
    'Female',
    'Other',];
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 50,
                  child: Icon(
                    Icons.person_3_outlined,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50),
                  child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: Icon(
                        Icons.add_ic_call_sharp,
                        color: Colors.white,
                        size: 20,
                      )),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Name"),
            ),
          ),
          SizedBox(
              height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Nick Name"),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Email"),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon:DropdownButton(
                    value: dropdownvalue,
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items, child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                        print(newValue);
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Gender"),
            ),
          ),
    SizedBox(  height: 30.h,),
    Container(
    width: 350.w,
    height: 60.h,
    decoration: ShapeDecoration(
    color: Color(0xFF0961F5),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30),
    ),),
     child:    Center(
       child: Text(
            'Continue',
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
        ],
      ),
    );
  }
}
