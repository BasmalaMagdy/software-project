import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/payment.dart';
class done extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              SizedBox(height: 60.0,),
              new Image.asset('images/done-icon-10.jpg', //================================photo====================================================
                width: 300.0,
                height: 300.0,
              ),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Text(
                  "The payment is done.",
                  style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                  color: Colors.green,
                  onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count ++ >= 5);
               }, child: Text('Back to home')),
            ],
          ),

        ),
    );


  }
}
