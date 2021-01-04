import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';




class EditProfile extends StatefulWidget {
  static String routeName = "/editprofile";
  EditProfile({Key key, this.person}) : super(key: key);
  final Map person;
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  bool _showPassword = false;
  PickedFile _imageFile;
  TextEditingController _name = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("images/${widget.person['photo']}")
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Icon(
            Icons.circle,
            color: Colors.white,
            size: 40.0,
          ),
        ),
        Positioned(
          bottom: 3.0,
          right: 0.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.edit,
              color: Colors.black,
              size: 35.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return "Name can't be empty";

        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2,
            )),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        labelText: "Name",
        helperText: "Name can't be empty",
        hintText: "Dev Stack",
      ),
    );
  }

  Widget textfield({@required String hintText}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 4,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
               /* color: Colors.blue,*/
              ),
              /*focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  )),*/
              labelText: hintText,
              //hintText: hintText,
              labelStyle: TextStyle(
                letterSpacing: 2,
                color: Colors.black54,
                  fontWeight: FontWeight.bold,
              ),
              hintStyle: TextStyle(
                letterSpacing: 2,
                color: Colors.black54,
                  fontWeight: FontWeight.bold,
              ),
              fillColor: Colors.white30,
              filled: false,
            ),
          ),
        ),
      ),
    );
  }

  Widget passfield({@required String hintText}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 4,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          decoration: InputDecoration(
              labelText: hintText,
              labelStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              fillColor: Colors.white30,
              filled: false,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child:
                Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        //backgroundColor: const Color(0xFF167F67),
        title: Text(
          'Edit Profile', style: TextStyle(
          color: Colors.black
        ),

        ),
      ),

      body: ListView(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
        //padding: EdgeInsets.only(top: 15, bottom: 15),
        children: [
          imageProfile(),
          SizedBox(
            height: 40,
          ),
          textfield(
            hintText: 'person name',
          ),
          textfield(
            hintText: 'Email',
          ),
          textfield(
            hintText: 'Phone',
          ),
          passfield(
            hintText: 'Password',
          ),
          passfield(
            hintText: 'ConfirmPassword',
          ),
          Container(
            margin: EdgeInsets.only(left: 65,right: 65, top: 10),
            height: 55,
            //width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {},
              color: Colors.white,
              child: Center(
                child: Text(
                  "Update",
                  style: TextStyle(
                      fontSize: 23, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

