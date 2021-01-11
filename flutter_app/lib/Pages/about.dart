import 'package:flutter/material.dart';


class About extends StatelessWidget {
  static String routeName = "/about";
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: new AppBar(
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text('About', style: TextStyle(color: Colors.black)),
        ),
        body:ListView(
        padding: EdgeInsets.all(20),

        children: [
         Center(child: Text("Fetch Application",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15))),
          SizedBox(
            height: 20.0,
          ),
          Text("E-commerce app any random description."),
          Text("\n  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          SizedBox(
            height: 40.0,
          ),
          Text("Contacts", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
          Row(children: [
              Icon(Icons.email, color: Colors.black),
              SizedBox(
                width: 10.0,
              ),
            Text("Fetch@gmail.com"),
          ]),
          Row(children: [
            Icon(Icons.phone, color: Colors.black),
            SizedBox(
              width: 10.0,
            ),
            Text("+201112545887"),
          ]),


       ],

    ));
  }
}
