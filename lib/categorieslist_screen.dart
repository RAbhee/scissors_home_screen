import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scissors_home_screen/categories.dart';

class CategoriesListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          Categories categories = categoriesList[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListTile(
                    title: Text(categories.title,style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 15)),
                        Text(
                          categories.price,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Set your desired border radius
                      child: Image.network(categories.image),

                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        _showBottomSheet(context, 'Item $index details');
                        //_showBottomSheet(context);
                      },

                      child: const Text(
                        'ADD',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14,bottom: 5),
                  child: Text(
                    categories.description,
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}


void _showBottomSheet(BuildContext context, String content) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        height: 200.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bottom Sheet Content',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(content),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    },
  );
}
