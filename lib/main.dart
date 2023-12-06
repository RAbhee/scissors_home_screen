import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scissors_home_screen/screens/categorieslist_screen.dart';
import 'package:scissors_home_screen/theme.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //backgroundColor: Colors.cyan[700],//blueGrey[700],
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/backgroundimage.jpg"),
                      fit: BoxFit.cover
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.8)
                ),
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20.0)),
                      ClipRect(
                        //borderRadius: BorderRadius.circular(15),
                        child:
                        Image.asset("images/logooo.png",
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 2,),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 32)),
                      Text("Scissor's",style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Services",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,),
                      )
                    ],
                  ),
                  Expanded(
                    child: CategoriesListScreen(),
                  ),

                ],

              )

            ],
          ),






        )

    );
  }
}
