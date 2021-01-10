import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/payment.dart';

class cardForm extends StatefulWidget {
  @override
  _cardFormState createState() => _cardFormState();
}

class _cardFormState extends State<cardForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Card details'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Card number'),
                  // The validator receives the text that the user has entered.
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
                  InputDecoration(hintText: 'Expired Date XX/XX'),
                  // The validator receives the text that the user has entered.
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
                  InputDecoration(hintText: 'CVV'),
                  // The validator receives the text that the user has entered.
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
                  InputDecoration(hintText: 'Card Holder'),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),

            ],
          ),
        ),

        //===============================================================================
        bottomNavigationBar: new Container(
          padding: const EdgeInsets.only(left: 70.0, top: 50.0, right: 70.0, bottom: 50.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: new MaterialButton(
                  onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => paymentForm()));
                  },
                  child: new Text("Confirm",
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
