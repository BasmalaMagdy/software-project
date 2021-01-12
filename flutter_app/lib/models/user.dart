class UserData {
  final String uid;
  String name = '';
  String email = '';
  String phone = '';
  int points;
  String type;
  String photo;
  bool vip;
  String brand = '';
  bool guest = false;

  UserData(
      {this.uid,
      this.email,
      this.name,
      this.phone,
      this.photo,
      this.points,
      this.type,
      this.vip,
      this.brand,
      this.guest});
}
