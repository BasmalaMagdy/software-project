import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/credit_card.dart';
import 'package:flutter_app/Pages/end.dart';
import 'package:flutter_app/common/size_config.dart';

class PaymentForm extends StatefulWidget {
  PaymentForm({this.cart, this.user});
  final cart;
  final user;
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  String _paymentmethod;
  String address;
  String phone;
  String currency;
  String cardnumber;
  String expireddate;
  String cvv;
  String cardholder;
  @override
  Widget build(BuildContext context) {
    print('********************I AM IN PAYMENT FILE **************');
    print(widget.cart[0]);
    print(widget.user.uid);

    print(_paymentmethod);
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
        child: ListView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: new Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                    flex: 4, child: new Text("Choose the Payment currency")),
              ],
            ),
            if (currency == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        currency = 'Dollar';
                      });
                    },
                    child: Text('Dollar'),
                  ),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        currency = 'LE';
                      });
                    },
                    child: Text('Egypt Pound'),
                  ),
                ],
              ),
            if (currency != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$currency'),
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          currency = null;
                        });
                      })
                ],
              ),
            Row(
              children: <Widget>[
                Expanded(flex: 2, child: new Icon(Icons.local_atm)),
                Expanded(flex: 4, child: new Text("Choose the Payment method")),
              ],
            ),
            if (_paymentmethod == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _paymentmethod = 'Credit Card';
                      });
                    },
                    child: Text('Credit Card'),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _paymentmethod = 'cash';
                      });
                    },
                    child: Text('cash'),
                  ),
                ],
              ),
            SizedBox(
              height: 20,
            ),
            if (_paymentmethod != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$_paymentmethod'),
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _paymentmethod = null;
                        });
                      })
                ],
              ),
            if (_paymentmethod == 'Credit Card')
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Enter your Card Number'),
                  onSaved: (newValue) => cardnumber = newValue,
                  validator: (value) {
                    if (value.isEmpty && _paymentmethod == 'Credit Card') {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
            if (_paymentmethod == 'Credit Card')
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Enter Rxpired Date'),
                  onSaved: (newValue) => expireddate = newValue,
                  validator: (value) {
                    if (value.isEmpty && _paymentmethod == 'Credit Card') {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
            if (_paymentmethod == 'Credit Card')
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Enter CVV'),
                  onSaved: (newValue) => cvv = newValue,
                  validator: (value) {
                    if (value.isEmpty && _paymentmethod == 'Credit Card') {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
            if (_paymentmethod == 'Credit Card')
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Enter your Card holder'),
                  onSaved: (newValue) => cardholder = newValue,
                  validator: (value) {
                    if (value.isEmpty && _paymentmethod == 'Credit Card') {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
            Container(
              padding: const EdgeInsets.only(
                  left: 70.0, top: 50.0, right: 70.0, bottom: 50.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Done(
                                      user: widget.user,
                                      cart: widget.cart,
                                      address: address,
                                      phone: phone,
                                      paymentmethod: _paymentmethod,
                                      currency: currency)));
                        }
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
            )
          ],
        ),
      ),

      //===============================================================================
    );
  }
}
