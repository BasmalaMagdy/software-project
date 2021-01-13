class OrderData {
  String oid;
  String uid;
  String sid;
  String address;
  String phone;
  String paymentmethod;
  String currency;
  double total;
  OrderData(
      {this.address,
      this.currency,
      this.oid,
      this.paymentmethod,
      this.phone,
      this.sid,
      this.total,
      this.uid});
}
