import 'package:flutter/material.dart';
import 'package:scissors_home_screen/categories.dart';
import 'package:scissors_home_screen/categorieslist_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15,top: 10)),
                    Image.asset("images/Scissors logo.jpg",height: 100,width: 100,)],
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      "Scissor's",
                      style: TextStyle(fontSize: 20,fontFamily: "Courier",fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // Padding(padding: EdgeInsets.symmetric(horizontal: 230.0)),
                    Text("Services",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),)
                  ],
                ),
                Expanded(
                  child: CategoriesListScreen(),
                ),
              ]
          ),
        ));
  }
}