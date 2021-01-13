import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/payment.dart';
import 'package:flutter_app/services/database.dart';

class Done extends StatelessWidget {
  Done(
      {this.cart,
      this.address,
      this.currency,
      this.paymentmethod,
      this.phone,
      this.user,
      this.total});
  final cart;
  final paymentmethod;
  final phone;
  final currency;
  final address;
  final user;
  final total;
  @override
  Widget build(BuildContext context) {
    print('********************I AM IN Done FILE **************');
    print(cart[0]);
    print(user.uid);
    print(address);
    print(currency);
    print(phone);
    print(paymentmethod);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            new Image.asset(
              'images/done-icon-10.jpg', //================================photo====================================================
              width: 300.0,
              height: 300.0,
            ),
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text(
                "The payment is done.",
                style: TextStyle(
                    color: Colors.grey[500], fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
                color: Colors.green,
                onPressed: () {
                  DatabaseService().AddOrder(
                      user: user,
                      address: address,
                      cart: cart,
                      currency: currency,
                      paymentmethod: paymentmethod,
                      phone: phone,
                      uid: user.uid,
                      sid: cart[0].sid,
                      total: total);
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 4);
                },
                child: Text('Back to home')),
          ],
        ),
      ),
    );
  }
}
