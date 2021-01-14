import 'dart:io';
import 'package:flutter_app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';
import '../../Components/default_button.dart';
import '../../Components/form_error.dart';
import '../../services/storage.dart';
import '../../services/database.dart';

class Item {
  const Item(this.name);
  final String name;
}

class GetDataForm extends StatefulWidget {
  GetDataForm({this.product, this.user});
  final ProductData product;
  final user;
  @override
  _GetDataFormState createState() => _GetDataFormState();
}

class _GetDataFormState extends State<GetDataForm> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String brand;
  int price;
  String color;
  int quantity;
  String sizes;
  String sid;
  String description;

  Item selectedUser;
  List<Item> users = <Item>[
    const Item('Default'),
    const Item('Shirt'),
    const Item('Dress'),
    const Item('Formal'),
    const Item('Informal'),
    const Item('Jeans'),
    const Item('Shoes'),
  ];

  final List<String> errors = [];

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildcategoryDropdownButtonFormField(),
          SizedBox(height: 10),
          //USERNAME TEXT FIELD
          buildnameFormField(),
          SizedBox(height: 10),
          buildpriceFormField(),
          SizedBox(height: 10),
          buildbrandFormField(),
          SizedBox(height: 10),
          buildsizeFormField(),
          SizedBox(height: 10),
          builddescriptionFormField(),
          SizedBox(height: 10),
          buildquantityFormField(),
          SizedBox(height: 10),
          buildcolorFormField(),
          SizedBox(height: 10),
          FormError(errors: errors),
          SizedBox(height: 10),

          DefaultButton(
            text: "Update data",
            press: () async {
              //GO TO HOME PAGE WITH NEW PROFILE INFO

              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                DatabaseService().updateProductData(
                    name: name,
                    category: selectedUser.name,
                    description: description,
                    sid: widget.user.uid,
                    price: price,
                    quantity: quantity,
                    color: color,
                    size: sizes,
                    photo: widget.product.photo,
                    pid: widget.product.pid);
                setState(() {
                  DoneUpload(context);
                });
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildnameFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Product Name",
        hintText: "Enter your Product Name.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kProductNameNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kProductNameNullError);
        }
        return null;
      },
    );
  }

  TextFormField builddescriptionFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Product description",
        hintText: "Enter your Product description.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => description = newValue,
      onChanged: (value) {},
      validator: Validate.productdescriptionvalidator,
    );
  }

  TextFormField buildpriceFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Product price",
        hintText: "Enter your Product price.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => price = int.parse(newValue),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kProductPriceNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kProductPriceNullError);
        }
        return null;
      },
    );
  }

  TextFormField buildbrandFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Product brand",
        hintText: "Enter your product brand.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => brand = newValue,
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kProductBrandNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kProductBrandNullError);
        }
        return null;
      },
    );
  }

  TextFormField buildsizeFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Product Sizes",
        hintText: "Enter your Product sizes.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => sizes = newValue,
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kProductSizeNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kProductSizeNullError);
        }
        return null;
      },
    );
  }

  TextFormField buildquantityFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Product quantity",
        hintText: "Enter your Product quantity.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => quantity = int.parse(newValue),
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kProductQuantityNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kProductQuantityNullError);
        }
        return null;
      },
    );
  }

  TextFormField buildcolorFormField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Product Color",
        hintText: "Enter your Product Color.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: 12),
      cursorColor: Colors.black,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => color = newValue,
      onChanged: (value) {},
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kProductColorNullError);
          return "";
        } else if (value.isNotEmpty) {
          removeError(error: kProductColorNullError);
        }
        return null;
      },
    );
  }

  DropdownButtonFormField buildcategoryDropdownButtonFormField() {
    return DropdownButtonFormField(
      hint: Text("Select Category"),
      value: selectedUser,
      onSaved: (newValue) => selectedUser = newValue,
      onChanged: sset,
      validator: (value) {
        if (value.name == 'Default') {
          addError(error: kProductCategoryNullError);
          return "";
        } else {
          removeError(error: kProductCategoryNullError);
        }
        return null;
      },
      items: users.map((Item user) {
        return DropdownMenuItem<Item>(
          value: user,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Text(
                user.name,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  DoneUpload(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Product Updated'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Press Approve'),
                // Text('Would you like to approve of this message?'),
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

  void sset(var value) {
    setState(() {
      selectedUser = value;
    });
  }
}

class Validate {
  static String productnamevlaidator(value) {
    if (value.isEmpty) {
      //addError(error: kProductNameNullError);
      return kProductNameNullError;
    }
    /*else if (value.isNotEmpty) {
          //removeError(error: kProductNameNullError);
        }*/
    return null;
  }

  static String productpricevalidator(value) {
    if (value.isEmpty) {
      // addError(error: kProductPriceNullError);
      return kProductPriceNullError;
    }
    /* else if (value.isNotEmpty) {
         // removeError(error: kProductPriceNullError);
        }*/
    return null;
  }

  static String productdescriptionvalidator(value) {
    if (value.isEmpty) {
      // addError(error: kProductPriceNullError);
      return 'Description is Empty!!';
    }
    /* else if (value.isNotEmpty) {
         // removeError(error: kProductPriceNullError);
        }*/
    return null;
  }

  static String productbrandvalidator(value) {
    if (value.isEmpty) {
      //addError(error: kProductBrandNullError);
      return kProductBrandNullError;
    }
    /*else if (value.isNotEmpty) {
          //removeError(error: kProductBrandNullError);
        }*/
    return null;
  }

  static String productsizevalidator(value) {
    if (value.isEmpty) {
      // addError(error: kProductSizeNullError);
      return kProductSizeNullError;
    }
    /*else if (value.isNotEmpty) {
          //removeError(error: kProductSizeNullError);
        }*/
    return null;
  }

  static String productquantityvalidator(value) {
    if (value.isEmpty) {
      // addError(error: kProductQuantityNullError);
      return kProductQuantityNullError;
    }
    /* else if (value.isNotEmpty) {
          removeError(error: kProductQuantityNullError);
        }*/
    return null;
  }

  static String productcolorvalidator(value) {
    if (value.isEmpty) {
      // addError(error: kProductColorNullError);
      return kProductColorNullError;
    }
    /* else if (value.isNotEmpty) {
          removeError(error: kProductColorNullError);
        }*/
    return null;
  }

  static String productcategoryvalidator(value) {
    if (value.name == 'Default') {
      //addError(error: kProductCategoryNullError);
      return kProductCategoryNullError;
    }
    /*else {
          removeError(error: kProductCategoryNullError);
        }*/
    return null;
  }
}
