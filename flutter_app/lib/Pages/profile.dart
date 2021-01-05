import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/editprofile.dart';

class Profile extends StatefulWidget {
  static String routeName = "/profile";
  Profile({Key key, this.person}) : super(key: key);
  final Map person;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text('Profile',  style: TextStyle(
            color: Colors.black
        )),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 10.0),
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('images/${widget.person['photo']}'),
              radius: 90.0,
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
            '${widget.person['name']}',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 20,
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
                width: 10.0,
              ),
              Text(
                '${widget.person['account']}',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 20,
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
                '${widget.person['phone']}',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            //width: 70,
            margin: EdgeInsets.only(left: 70,right: 70, top: 10),
            height: 45,
            //width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditProfile(person: widget.person)));
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
      ),
    );
  }
}
