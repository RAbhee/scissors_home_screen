import 'package:flutter/material.dart';
import 'package:scissors_home_screen/categorieslist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: CategoriesListScreen(),
      ),
    );
  }

}


