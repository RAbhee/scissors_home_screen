import 'package:flutter/material.dart';

import 'categories.dart';

class CategoriesListScreen extends StatefulWidget {

  @override
  _CategoriesListScreenState createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {

  List<Categories> categoriesList = [
    Categories(
      title: "Men's Haircut",
      price: "Rs 200/-",
      description: "You look sleek with that new haircut.",
      image: "images/Mens.jpg",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Men's Shaving",
      price: "Rs 100/-",
      description:
      "Wait to shave after or several minutes into a shower or bath as warm water helps soften hair and open pores.",
      image: "images/shaving.jpg",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Hair Color",
      price: "Rs 300/-",
      description: "Invest in your hair color, it's the crown you never take off.",
      image: "images/hair color.jpg",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Face Mask",
      price: "Rs 200/-",
      description: "Looks so Good on the Outside, It'll Make You Feel Good Inside.",
      image: "images/face care.webp",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Massage",
      price: "Rs 500/-",
      description:
      "A Massage should be pleasing to all the senses, creating a relaxed and positive atmosphere.",
      image: "images/massage.webp",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
  ];

  List<Categories> selectedCategories = [];

  void _toggleAddClicked(int index) {
    setState(() {
      categoriesList[index].addClickedStatus.isAddClicked =
      !categoriesList[index].addClickedStatus.isAddClicked;
      if (categoriesList[index].addClickedStatus.isAddClicked) {
        selectedCategories.add(categoriesList[index]);
      } else {
        selectedCategories.remove(categoriesList[index]);
      }
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      if (categoriesList[index].quantity < 1) {
        categoriesList[index].quantity++;
      }
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (categoriesList[index].quantity > 0) {
        categoriesList[index].quantity--;
        categoriesList[index].addClickedStatus.isAddClicked = false;
        selectedCategories.remove(categoriesList[index]);
      }
    });
  }

  String calculateTotalPrice() {
    double totalPrice = 0.0;
    for (Categories category in selectedCategories) {
      // Extract numeric part of the price
      String priceString = category.price.replaceAll(RegExp(r'[^0-9.]'), '');

      // Check if the price is not empty
      if (priceString.isNotEmpty) {
        // Check if the price contains a decimal point
        if (priceString.contains('.')) {
          totalPrice += double.parse(priceString);
        } else {
          totalPrice += int.parse(priceString);
        }
      }
    }

    // Format the total price with the rupee symbol and "-/-" suffix
    String formattedTotalPrice =
    totalPrice == 0 ? '₹0/-' : '₹${totalPrice.toStringAsFixed(0)}/-';

    return formattedTotalPrice;
  }

  void _showSelectedCategoriesPopup() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 300,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Services',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedCategories.length,
                  itemBuilder: (context, index) {
                    Categories category = selectedCategories[index];
                    return ListTile(
                      title: Text(category.title),
                      subtitle: Text(category.price),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      'Total Price: ${calculateTotalPrice()}',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('BOOK'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          Categories categories = categoriesList[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListTile(
                    title: Text(
                      categories.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(categories.image),
                    ),

                    trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          _toggleAddClicked(index);
                          if (!categories.addClickedStatus.isAddClicked) {
                            _incrementQuantity(index);
                          } else {
                            _decrementQuantity(index);
                          }
                          _showSelectedCategoriesPopup();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            categories.addClickedStatus.isAddClicked
                                ? 'REMOVE'
                                : 'ADD',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, bottom: 5),
                  child: Text(
                    categories.description,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
