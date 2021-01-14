class UserData {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final num points;
  final String type;
  final String photo;
  final bool vip;
  final bool guest;
  final num order;
  UserData(
      {this.uid,
      this.email,
      this.name,
      this.phone,
      this.photo,
      this.points,
      this.type,
      this.vip,
      this.guest,
      this.order});

  double getvipdiscount() {
    if (vip)
      return 0.2;
    else
      return 1;
  }

  double getpointdiscount() {
    if (points < 40)
      return 1;
    else
      return 0.8;
  }
}
