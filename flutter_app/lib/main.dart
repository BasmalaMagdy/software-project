import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:  ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home:  DropdownScreen(),
  ));
}
class Item {
  const Item(this.name);
  final String name;
}
class DropdownScreen extends StatefulWidget {
  State createState() =>  AddProductSeller();
}
class AddProductSeller extends State<DropdownScreen> {
  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Shirt'),
    const Item('Dress'),
    const Item('Formal'),
    const Item('Informal'),
    const Item('Jeans'),
    const Item('Shoes'),
  ];
  File _image1;
  File _image2;
  File _image3;

  // for choosing a photo

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  MaterialApp(
      home:  Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF167F67),
          title: Text(
            'Add a Product',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.grey, width: 2.5),
                      onPressed: (){
                        _selectImage(ImagePicker.pickImage(source: ImageSource.gallery), 1);
                      },
                      child: _displayChild1()
          ),
                    ),
        ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.grey, width: 2.5),
                      onPressed: (){
                        _selectImage(ImagePicker.pickImage(source: ImageSource.gallery), 2);
                      },
                      child: _displayChild2(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.grey, width: 2.5),
                      onPressed: (){
                        _selectImage(ImagePicker.pickImage(source: ImageSource.gallery), 3);
                      },
                      child: _displayChild3()
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child:  DropdownButton<Item>(
                hint:  Text("Select Category"),
                value: selectedUser,
                onChanged: (Item value) {
                  setState(() {
                    selectedUser = value;
                  });
                },
                items: users.map((Item user) {
                  return  DropdownMenuItem<Item>(
                    value: user,
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        Text(
                          user.name,
                          style:  TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Product Name',
                  /*validator: (value){  // Not working :(
                    if (value.isEmpty){
                      return 'You must enter a name for the product';
                    }
                  },*/
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the price of the product in LE.',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the color of the product',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Quantity',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the available sizes',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter the brand name',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: (){},
                  color: Colors.black,
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  void _selectImage(pickImage, int imageNumber) async{
    File tempImg = await pickImage;
    switch(imageNumber){
      case 1: setState(() => _image1 = tempImg);
      break;
      case 2: setState(() => _image2 = tempImg);
      break;
      case 3: setState(() => _image3 = tempImg);
      break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 30),
        child: new Icon(Icons.add, color: Colors.grey,),
      );
    }
    else{
      return Image.file(_image1, fit: BoxFit.fill, width: double.infinity,);
    }
  }
  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 30),
        child: new Icon(Icons.add, color: Colors.grey,),
      );
    }
    else{
      return Image.file(_image2, fit: BoxFit.fill, width: double.infinity,);
    }
  }
  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 30),
        child: new Icon(Icons.add, color: Colors.grey,),
      );
    }
    else{
      return Image.file(_image3, fit: BoxFit.fill, width: double.infinity,);
    }
  }
}