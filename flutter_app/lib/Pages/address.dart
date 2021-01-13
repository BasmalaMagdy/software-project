import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/payment.dart';

class Address extends StatelessWidget {
  Address({this.cart});
  final cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(''),
      ),
      body: Center(
        child: Column(
          children: [
            new Image.asset(
              'images/address.png', //================================photo====================================================
              width: 300.0,
              height: 300.0,
            ),
            new Text(
              "Add an address so we can get cracking on the delivery!",
              style: TextStyle(
                  color: Colors.grey[500], fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 70.0, top: 50.0, right: 70.0, bottom: 50.0),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentForm(cart: cart)));
                        },
                        color: Colors.red,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("Add a new address")),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
