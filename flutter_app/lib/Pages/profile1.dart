import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/profile.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.person}) : super(key: key);
  final Map person;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//Map person = widget.person;
  @override
  Widget build(BuildContext context) {
    //person = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/${widget.person['photo']}'),
                radius: 90.0,
              ),
            ),
            Divider(
              height: 40,
              color: Colors.white,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '${widget.person['name']}',
              style: TextStyle(
                color: Colors.amberAccent[200],
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
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Icon(Icons.email, color: Colors.grey[400]),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${widget.person['account']}',
                  style: TextStyle(
                    color: Colors.amberAccent[200],
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
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.grey[400]),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '${widget.person['phone']}',
                  style: TextStyle(
                    color: Colors.amberAccent[200],
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
              height: 55,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditProfile(person: widget.person)));
                  //Navigator.pushNamed(context, '/profile1', arguments: widget.person);
                },
                color: Colors.grey,
                child: Center(
                  child: Text(
                    "Edit",
                    style: TextStyle(fontSize: 23, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
