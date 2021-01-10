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

class SearchProductData {
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

  SearchProductData({
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

  ProductData change() {
    return ProductData(
      color: color,
      pid: pid,
      name: name,
      category: category,
      description: description,
      photo: photo,
      price: price,
      quantity: quantity,
      sid: sid,
      size: size,
    );
  }
}
