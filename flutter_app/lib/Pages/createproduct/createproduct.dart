import 'dart:io';
import '../../Pages/createproduct/dataform.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/constants.dart';
import 'package:path/path.dart' as path;

class Item {
  const Item(this.name);
  final String name;
}

class CreateProduct extends StatefulWidget {
  static String routeName = "/createproduct";
  CreateProduct({Key key}) : super(key: key);

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
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
  List<File> Pimglist = List<File>();
  int imgocunter = 0;
  List<String> imgnames = List<String>();
  bool _uploaded = false;
  final _formKey = GlobalKey<FormState>();
  String name;
  String price;
  String color;
  String quantity;
  String sizes;
  String brand;

  DoneUpload(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Product Created'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Press ok'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
                //Navigator.of(context).popUntil((route) => );
              },
            ),
          ],
        );
      },
    );
  }

  // for choosing a photo
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),

        centerTitle: true,
        //backgroundColor: const Color(0xFF167F67),
        title: Text(
          'Add a Product',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(children: [
        Container(
          height: 140.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Container(
                width: 110,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlineButton(
                      borderSide: BorderSide(color: Colors.grey, width: 2.5),
                      onPressed: () {
                        _selectImage(
                            ImagePicker().getImage(source: ImageSource.gallery),
                            1);
                      },
                      child: _displayChild0()),
                ),
              ),
              if (Pimglist.length != 0)
                for (File img in Pimglist)
                  Container(
                    width: 120,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.5),
                          onPressed: () {
                            _selectImage(
                                ImagePicker()
                                    .getImage(source: ImageSource.gallery),
                                1);
                          },
                          child: _displayChild1(img)),
                    ),
                  ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GetDataForm(
            Pimglist: Pimglist,
            imgnames: imgnames,
          ),
        ),
      ]),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
          if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
    );
  }

  void _selectImage(pickImage, int imageNumber) async {
    PickedFile pick = await pickImage;
    File tempImg = File(pick.path);
    print('******length***');
    print(tempImg.path);
    String dir = path.basename(tempImg.path);
    imgnames.add(dir);
    print(dir);
    setState(() => Pimglist.add(tempImg));
    print('******length*****');
    print(Pimglist.length);
    /*switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }*/
  }

  Widget _displayChild0() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 30, 14, 30),
      child: new Icon(
        Icons.add,
        color: Colors.grey,
      ),
    );
  }

  Widget _displayChild1(File image1) {
    if (image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 30),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 30),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 30, 14, 30),
        child: new Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
}
