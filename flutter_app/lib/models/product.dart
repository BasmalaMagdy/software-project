class ProductDoc {
  final String pid;
  ProductDoc({this.pid});
}

class ProductData {
  final String pid;
  final String name;
  final String category;
  final String description;
  final String photo;
  final String sid;
  final int price;
  final int quantity;
  final String size;
  final String color;

  ProductData({
    this.pid,
    this.name,
    this.category,
    this.description,
    this.price,
    this.quantity,
    this.photo,
    this.sid,
    this.color,
    this.size,
  });
}
