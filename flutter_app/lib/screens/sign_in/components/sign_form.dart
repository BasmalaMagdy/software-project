import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:provider/provider.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../common/constants.dart';
import '../../../common/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  //final AuthService _auth = AuthService();
  ////////////////LATEST

  ////////////////LATEST
  final _formKey = GlobalKey<FormState>();

  // textfield state
  String email = '';
  String password = '';
  bool remember = false;
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
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              SizedBox(width: getProportionateScreenWidth(50)),
              //Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                  /*Navigator.popAndPushNamed(
                      context, ForgotPasswordScreen.routName);*/
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.orange[900], fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                dynamic result =
                    await context.read<AuthService>().signIn(email, password);

                if (result is String) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        actions: [
                          MaterialButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('back'),
                          )
                        ],
                        content: Text(result),
                      );
                    },
                  );
                }
                print(email);
                print(password);
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProvider(uid: result.uid)));*/
                //print(UserData().type);
                // print(result.uid);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      key: Key('pass'),
      keyboardType: TextInputType.visiblePassword,
      maxLength: 20,
      cursorColor: Colors.black,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPasswordNullError);
          if (value.length >= 8) {
            removeError(error: kPasswordShortError);
          }
        }

        setState(() => password = value);

        return null;
      },
      validator: Validate.passwordvalidate,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(30)),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      key: Key('email'),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
          if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
        }
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }

        setState(() => email = value);

        return null;
      },
      validator: Validate.emailvalidate,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email.",
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(30)),
    );
  }
}

class Validate {
  static String passwordvalidate(value) {
    if (value.isEmpty) {
      //addError(error: kPasswordNullError);
      return kPasswordNullError;
    } else if (value.length < 8) {
      //addError(error: kPasswordShortError);
      return kPasswordShortError;
    }
    return null;
  }

  static String emailvalidate(value) {
    if (value.isEmpty) {
      //addError(error: kEmailNullError);
      return kEmailNullError;
    } else if (!emailValidatorRegExp.hasMatch(value)) {
      //addError(error: kInvalidEmailError);
      return kInvalidEmailError;
    }
    return null;
  }
}
