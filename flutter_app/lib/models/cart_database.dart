class cartDoc {
  final String cartid;
  cartDoc({this.cartid});
}

class userCartData {
  final String cartid;
  final String uid;
  final String pid;
  final String sid;
  final String name;
  final String photo;
  final int price;
  final int pquantity;
  final String size;
  final String color;

  userCartData({
    this.sid,
    this.cartid,
    this.uid,
    this.pid,
    this.name,
    this.price,
    this.pquantity,
    this.photo,
    this.color,
    this.size,
  });
}
