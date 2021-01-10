import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/database.dart';
import 'package:provider/provider.dart';

import '../common/size_config.dart';
import '../models/product.dart';

class Settings extends StatelessWidget {
  static String routeName = "/Settings";
  @override
  Widget build(BuildContext context) {
    final UserData user = context.watch<UserData>();
    final List<SearchProductData> history =
        context.watch<List<SearchProductData>>();
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text('Settings', style: TextStyle(color: Colors.black)),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remove my history',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenWidth * 0.05,
                  ),
                ),
                FlatButton(
                  onPressed: history.isNotEmpty
                      ? () {
                          DatabaseService().DeleteHistoryData(uid: user.uid);
                        }
                      : null,
                  height: 40,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.clear),
                      Text(
                        'Clear',
                        style:
                            TextStyle(fontSize: SizeConfig.screenWidth * 0.05),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remove Vip badge',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenWidth * 0.05,
                  ),
                ),
                FlatButton(
                  onPressed: user.vip
                      ? () {
                          DatabaseService()
                              .upgradeUserToVip(vip: false, customer: user);
                        }
                      : null,
                  height: 40,
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.clear),
                      Text(
                        'Remove',
                        style:
                            TextStyle(fontSize: SizeConfig.screenWidth * 0.05),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
