import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../common/constants.dart';
import '../common/size_config.dart';
import '../components/form_error.dart';
import '../models/user.dart';
import '../services/database.dart';

class EditProfile extends StatefulWidget {
  static String routeName = "/editprofile";
  EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String name;
  String email;
  String password;
  String confirmpassword;
  String phone;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  PickedFile _imageFile;
  TextEditingController _name = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Widget imageProfile(String photo) {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? AssetImage("images/${photo}")
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

  Widget textfield({@required String hintText}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 4,
        shadowColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(borderSide: BorderSide.none),
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
          style: TextStyle(fontSize: 13),
          cursorColor: Colors.black,
          keyboardType: TextInputType.name,
          onSaved: (newValue) => name = newValue,
          onChanged: (value) {},
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kNameNullError);
              return "";
            } else if (value.isNotEmpty) {
              removeError(error: kNameNullError);
            }
            return null;
          },
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
                child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              )),
        ),
      ),
    );
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

  TextFormField buildPhoneFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Phone number",
        hintText: "Enter a valid phone number.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(30)),
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kPhoneNullError);
          if (value.length < 11 || value.length > 11) {
            addError(error: kPhoneInvalidError);
            return "";
          } else if (value.length == 11) {
            removeError(error: kPhoneInvalidError);
          }
        }
        return null;
      },
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "User Name",
        hintText: "Enter your User Name.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(30)),
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      maxLength: 20,
      cursorColor: Colors.black,
      obscureText: _showConfirmPassword,
      onSaved: (newValue) => confirmpassword = newValue,
      onChanged: (value) {
        // if (password == confirmpassword) {
        //   removeError(error: kMatchPassError);
        // }
        // return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (value.isNotEmpty) {
          if (value == password) {
            removeError(error: kMatchPassError);
          } else if (value != password) {
            addError(error: kMatchPassError);
          }
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _showConfirmPassword = !_showConfirmPassword;
            });
          },
          child: Icon(
              _showConfirmPassword ? Icons.visibility_off : Icons.visibility),
        ),
        labelText: "Confirm password",
        hintText: "Re-enter password.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(30)),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      maxLength: 20,
      cursorColor: Colors.black,
      obscureText: _showPassword,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPasswordNullError);
        } else if (value.length >= 8) {
          removeError(error: kPasswordShortError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPasswordNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kPasswordShortError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          child: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
        ),
        labelText: "Password",
        hintText: "Enter your password.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(30)),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
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
      style: TextStyle(fontSize: getProportionateScreenWidth(30)),
    );
  }

  @override
  Widget build(BuildContext context) {
    UserData customer = context.watch<UserData>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
        //padding: EdgeInsets.only(top: 15, bottom: 15),
        children: [
          imageProfile(customer.photo),
          SizedBox(
            height: 40,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  //USERNAME TEXT FIELD
                  buildNameFormField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  /*  Email field  */
                  buildEmailFormField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  /*  password field  */
                  //buildPasswordFormField(),
                  /*  confirm field  */
                  //buildConfirmPasswordFormField(),
                  /*   Phone   */
                  buildPhoneFormField(),
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  FormError(errors: errors),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Container(
                    margin: EdgeInsets.only(left: 65, right: 65, bottom: 10),
                    height: 55,
                    //width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          DatabaseService().updateUserData(
                            id: customer.uid,
                            email: email,
                            name: name,
                            phone: phone,
                          );
                          setState(() {
                            DoneEdit(context);
                          });
                        }
                      },
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "Update",
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  DoneEdit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Profile Edited'),
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
}
