import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/payment.dart';
class done extends StatelessWidget {
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
            new Image.asset('images/done-icon-10.jpg', //================================photo====================================================
              width: 300.0,
              height: 300.0,
            ),
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text(
                "The payment is done.",
                style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),

      ),
      backgroundColor: Colors.white,
    );
  }
}
