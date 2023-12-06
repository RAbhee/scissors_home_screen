import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/categories.dart';
import 'bookingscreen.dart';

class CategoriesListScreen extends StatefulWidget {
  @override
  _CategoriesListScreenState createState() => _CategoriesListScreenState();
}
class _CategoriesListScreenState extends State<CategoriesListScreen> {
  List<Categories> categoriesList = [
    Categories(
      title: "Men's Haircut",
      price: "Rs 200/-",
      description: "(You look sleek with that new haircut.)",
      image: "images/Mens.jpg",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Men's Shaving",
      price: "Rs 100/-",
      description:
      "(Wait to shave after or several minutes into a shower or bath as warm water helps soften hair and open pores.)",
      image: "images/shaving.jpg",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Hair Color",
      price: "Rs 300/-",
      description: "(Invest in your hair color, it's the crown you never take off.)",
      image: "images/hair color.jpg",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Face Mask",
      price: "Rs 200/-",
      description: "(Looks so Good on the Outside, It'll Make You Feel Good Inside.)",
      image: "images/face care.webp",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
    Categories(
      title: "Massage",
      price: "Rs 500/-",
      description:
      "(A Massage should be pleasing to all the senses, creating a relaxed and positive atmosphere.)",
      image: "images/massage.webp",
      quantity: 0,
      addClickedStatus: AddClickedStatus(isAddClicked: false),
    ),
  ];

  List<Categories> selectedCategories = [];

  void _toggle(int index) {
    setState(() {
      Categories category = categoriesList[index];
      category.addClickedStatus.isAddClicked = !category.addClickedStatus.isAddClicked;

      if (category.addClickedStatus.isAddClicked) {
        selectedCategories.add(category);
        _incrementQuantity(index);
      } else {
        selectedCategories.remove(category);
        _decrementQuantity(index);
      }

      _showSelectedCategoriesPopup();
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

      String priceString = category.price.replaceAll(RegExp(r'[^0-9.]'), '');


      if (priceString.isNotEmpty) {

        if (priceString.contains('.')) {
          totalPrice += double.parse(priceString);
        } else {
          totalPrice += int.parse(priceString);
        }
      }
    }
    String formattedTotalPrice =
    totalPrice == 0 ? '₹0/-' : '₹${totalPrice.toStringAsFixed(0)}/-';

    return formattedTotalPrice;
  }

  void _showSelectedCategoriesPopup() {
    showModalBottomSheet(
      //backgroundColor: Colors.lightBlueAccent[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(50),bottom: Radius.circular(50)),),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selected Services:',
                style: GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: selectedCategories.length,
                  itemBuilder: (context, index) {
                    Categories category = selectedCategories[index];
                    return ListTile(
                      title: Text(
                        category.title,
                        style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        category.price,
                        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold,),
                      ),
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
                      'Total Price :  ${calculateTotalPrice()}',
                      style: GoogleFonts.poppins(fontSize: 16.0, fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookingSlotScreen()),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey),
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
    return
      Container(
        child: ListView.builder(
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
                        style: GoogleFonts.openSans(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 15)),
                          Text(
                            categories.price,
                            style: TextStyle
                              (color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(categories.image,height: 20,width: 15,),
                      ),

                      trailing: Container(
                        decoration: BoxDecoration(
                          color: categories.addClickedStatus.isAddClicked ? Colors.grey : Colors.brown,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _toggle(index);
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
                              ),//

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
                      style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
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

