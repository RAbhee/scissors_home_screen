
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scissors_home_screen/categories.dart';

class CategoriesListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: categoriesList.length,
          itemBuilder: (context, index){
            Categories categories = categoriesList[index];
            return Card(
                child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
              child: ListTile(
                title: Text(categories.title) ,
                subtitle: Text(categories.price.toString()),
                leading: Image.network(categories.image,
                  fit: BoxFit.cover,
                ),

                trailing: ElevatedButton(
                  onPressed: (){},
                  child: Text('ADD'),
                ),
              ),
            )
            );
          }
      ),
    );
  }
}