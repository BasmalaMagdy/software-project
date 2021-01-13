import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/credit_card.dart';
import 'package:flutter_app/Pages/end.dart';

class PaymentForm extends StatefulWidget {
  PaymentForm({this.cart, this.address});
  final cart;
  final address;
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String address;
    String phone;
    String currency;
    String paymentmethod;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(''),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Enter your address'),
                  // The validator receives the text that the user has entered.
                  onSaved: (newValue) => address = newValue,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Enter your phone number'),
                  onSaved: (newValue) => phone = newValue,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //saying to show that dialog in the context of the widget
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          content: new Text("choose the currency"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Icon(
                        Icons.monetization_on_outlined,
                        color: Colors.amber,
                      ),
                    ),
                    Expanded(child: new Text("Choose the Payment currency")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  //saying to show that dialog in the context of the widget
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          content: new Text("choose a method"),
                          actions: <Widget>[
                            Expanded(
                              child: new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CardForm()));
                                },
                                child: new Text("Credit Card"),
                              ),
                            ),
                            Expanded(
                              child: new MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: new Text("Cash"),
                              ),
                            ),
                          ],
                        );
                      });
                },
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Icon(Icons.local_atm)),
                    Expanded(child: new Text("Choose the Payment method")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
            ],
          ),
        ),

        //===============================================================================
        bottomNavigationBar: new Container(
          padding: const EdgeInsets.only(
              left: 70.0, top: 50.0, right: 70.0, bottom: 50.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: new MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Done(
                                cart: widget.cart,
                                address: address,
                                phone: phone,
                                paymentmethod: paymentmethod,
                                currency: currency)));
                  }, // a page need to be added
                  child: new Text(
                    "BUY",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ));
  }
}
