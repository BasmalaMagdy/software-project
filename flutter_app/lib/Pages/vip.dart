import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/database.dart';

class Vip extends StatelessWidget {
  Vip({this.user});
  final UserData user;
  static String routeName = "/vip";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text('Upgrade to VIP',
              style: TextStyle(color: Colors.amberAccent)),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Benefits',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Text('* Discount 10% on every order '),
            SizedBox(
              height: 5,
            ),
            Text('* no Ads'),
            SizedBox(
              height: 5,
            ),
            Text('* no Ads'),
            SizedBox(
              height: 5,
            ),
            Text('* no Ads'),
            SizedBox(
              height: 5,
            ),
            Text('* no Ads'),
            SizedBox(
              height: 60,
            ),
            Text(
              'Cost : 120\$',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                color: Colors.amber,
                textColor: Colors.black,
                onPressed: () {
                  DatabaseService().upgradeUserToVip(vip: true, customer: user);
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                },
                child: Text(
                  'Go Vip',
                ),
              ),
            )
          ],
        ));
  }
}
