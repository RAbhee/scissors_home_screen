
class Categories {
  late String title;
  late String price;
  late String description;
  late String image;

  Categories({required this.title, required this.price, required this.description, required this.image});
}

List<Categories> categoriesList = [
  Categories(
      title: "Men's Haircut",
      price: "Rs.200/-",
      description: "You look sleek with that new haircut." ,
      image: "images/Mens.jpg"
  ),

  Categories(
      title: "Men's Shaving",
      price: "Rs.100/-",
      description: "Wait to shave after or several minutes into a shower or bath as warm water helps soften hair and open pores.",
      image: "images/shaving.jpg"
  ),
  Categories(
      title: "Hair Color",
      price: "Rs.300/-",
      description: "Invest in your hair color, it's the crown you never take off.",
      image: "images/hair color.jpg"
  ),
  Categories(
      title: "Face Mask",
      price: "Rs.200/-",
      description: "Looks so Good on the Outside, It'll Make You Feel Good Inside.",
      image: "images/face care.webp"
  ),

  Categories(
      title: "Massage",
      price: "Rs.500/-",
      description: "A Massage should be pleasing to all the senses, creating a relaxed and positive atmosphere.",
      image: "images/massage.webp"
  )
];