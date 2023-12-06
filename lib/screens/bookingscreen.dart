
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSlotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.cyan[700],//blueGrey[700],
      body: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 10.0,)),

            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20.0)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "images/Scissors logo.jpg",
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),


            SizedBox(height: 8,),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Text(
                  "Scissor's",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'robotomoto'),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Services",
                  style: GoogleFonts.courierPrime(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),
                )
              ],
            ),
          ]
      ),
    );
  }
}
