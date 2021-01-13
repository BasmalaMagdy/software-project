import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Pages/editprofile.dart';
import '../common/size_config.dart';
import '../models/user.dart';
import '../services/storage.dart';

class Profile extends StatefulWidget {
  static String routeName = "/profile";
  Profile({Key key, this.user}) : super(key: key);
  final UserData user;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    //UserData widget.user = context.watch<UserData>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: widget.user.photo == ''
          ? ListView(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 10.0),
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 80,
                  ),
                ),
                Divider(
                  height: 40,
                  color: Colors.black,
                ),
                Text(
                  'NAME',
                  style: TextStyle(
                    color: Colors.red,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${widget.user.name}',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontSize: SizeConfig.screenWidth * 0.04,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'E-MAIL',
                  style: TextStyle(
                    color: Colors.red,
                    letterSpacing: 2.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.black),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.02,
                    ),
                    Text(
                      '${widget.user.email}',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: SizeConfig.screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'PHONE',
                  style: TextStyle(
                    color: Colors.red,
                    letterSpacing: 2.0,
                    fontSize: SizeConfig.screenWidth * 0.04,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(Icons.phone, color: Colors.black),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${widget.user.phone}',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: SizeConfig.screenWidth * 0.05,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  //width: 70,
                  margin: EdgeInsets.only(left: 70, right: 70, top: 10),
                  height: 45,
                  //width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfile(
                                    user: widget.user,
                                  )));
                    },
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "Edit",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : FutureBuilder(
              future: getProfileImage(
                  context, 'Users/${widget.user.uid}/${widget.user.photo}'),
              builder: (context, snapshot) {
                return ListView(
                  padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 10.0),
                  children: [
                    Center(
                      child: snapshot.data,
                      /* Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(image: snapshot.data)),
                      //child: snapshot.data != null ? snapshot.data : Loading(),
                    ),*/
                    ),

                    /*CircleAvatar(
                      child: snapshot.data != null ? snapshot.data : Loading(),
                      radius: 90.0,
                    ),*/

                    Divider(
                      height: 40,
                      color: Colors.black,
                    ),
                    Text(
                      'NAME',
                      style: TextStyle(
                        color: Colors.red,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${widget.user.name}',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: SizeConfig.screenWidth * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'E-MAIL',
                      style: TextStyle(
                        color: Colors.red,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.black),
                        SizedBox(
                          width: SizeConfig.screenWidth * 0.02,
                        ),
                        Text(
                          '${widget.user.email}',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: SizeConfig.screenWidth * 0.05,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'PHONE',
                      style: TextStyle(
                        color: Colors.red,
                        letterSpacing: 2.0,
                        fontSize: SizeConfig.screenWidth * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.black),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '${widget.user.phone}',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: SizeConfig.screenWidth * 0.05,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      //width: 70,
                      margin: EdgeInsets.only(left: 70, right: 70, top: 10),
                      height: 45,
                      //width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile(
                                        user: widget.user,
                                      )));
                        },
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "Edit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}
