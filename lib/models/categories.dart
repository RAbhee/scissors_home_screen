

class AddClickedStatus {
  bool isAddClicked;

  AddClickedStatus({
    this.isAddClicked = false,
  });
}

class Categories {
  String title;
  String price;
  String description;
  String image;
  int quantity;
  AddClickedStatus addClickedStatus;

  Categories({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,
    required this.addClickedStatus,
  });
}